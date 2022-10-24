import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../core/data/api_manager.dart';
import '../../../core/services/alert.dart';
import '../../../core/services/generic_error_handler.dart';
import '../../../core/utils/utils.dart';
import '../../../core/view/widgets/app_screen.dart';
import '../../../core/view/widgets/image_loader.dart';
import '../../../di/injection_container.dart';
import '../../logic/home/movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const id = '/movie_details_screen';

  const MovieDetailsScreen({Key? key, this.movieId}) : super(key: key);

  final int? movieId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<MovieDetailsCubit>(),
        ),
      ],
      child: Page(movieId: movieId),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, this.movieId}) : super(key: key);
  final int? movieId;

  @override
  State<Page> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<Page>
    with AutomaticKeepAliveClientMixin<Page> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadPageSections();
    });
  }

  void loadPageSections() {
    context.read<MovieDetailsCubit>().getMovieDetails(widget.movieId ?? 0);
    context.read<MovieDetailsCubit>().getVideo(widget.movieId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<MovieDetailsCubit, MovieDetailsState>(
          listenWhen: (previous, current) =>
              previous.response != current.response,
          listener: (context, state) {
            if (notNullNorEmpty(state.response)) {}
          },
        ),
        BlocListener<MovieDetailsCubit, MovieDetailsState>(
          listenWhen: (previous, current) =>
              previous.failure != current.failure,
          listener: (context, state) {
            final failure = state.failure;
            if (failure is ErrorFailure) {
              final error = failure.error;
              if (error is MessageResponse) {
                Alert.instance.error(context, error.message);
              }
            } else if (failure != null) {
              GenericErrorHandler.instance.handle(
                failure: failure,
                onRetry: () => context.read<MovieDetailsCubit>().retry(),
                context: context,
              );
            }
          },
        ),
      ],
      child: AppScreen(
        appBar: AppBar(
          title: const Text("Page"),
          centerTitle: false,
        ),
        child: SafeArea(
          child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
              return state.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: ImageLoader(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w600_and_h900_bestv2${state.response?.backdropPath ?? ''}",
                              height: 400,
                              width: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.response?.title ?? '',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              state.response?.overview ?? '',
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Trailer",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          YoutubePlayerIFrame(
                                            controller: YoutubePlayerController(
                                              initialVideoId: state
                                                      .model?.data[index].key ??
                                                  "",
                                            ),
                                            aspectRatio: 16 / 9,
                                          ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: 5,
                                          ),
                                      itemCount: state.model?.data.length ?? 0),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
