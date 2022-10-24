import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/home/view/widgets/movie_list_widget.dart';
import '../../../core/data/api_manager.dart';
import '../../../core/services/alert.dart';
import '../../../core/services/generic_error_handler.dart';
import '../../../core/utils/utils.dart';
import '../../../core/view/widgets/app_screen.dart';
import '../../../di/injection_container.dart';
import '../../logic/search/search_cubit.dart';
import '../widgets/movie_item_widget.dart';

class SearchScreen extends StatelessWidget {
  static const id = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<SearchCubit>(),
        ),
      ],
      child: const Search(),
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>
    with AutomaticKeepAliveClientMixin<Search> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchCubit, SearchState>(
          listenWhen: (previous, current) =>
              previous.movieResponseModel != current.movieResponseModel,
          listener: (context, state) {
            if (notNullNorEmpty(state.movieResponseModel?.data)) {}
          },
        ),
        BlocListener<SearchCubit, SearchState>(
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
                onRetry: () => context.read<SearchCubit>().retry(),
                context: context,
              );
            }
          },
        ),
      ],
      child: AppScreen(
        appBar: AppBar(
          title: const Text("Search"),
          centerTitle: false,
        ),
        child: SafeArea(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    onChanged: (String? query) {
                      if(query != null || query ==""){
                        context.read<SearchCubit>().search(query ??"");
                      }
                    },
                  ),
                  state.loading
                      ? const CircularProgressIndicator()
                      : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movieResponseModel?.data.length
                                      .toString() ??
                                  "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) =>
                                      MovieItemWidget(
                                          data: state.movieResponseModel
                                              ?.data[index]),
                                  separatorBuilder: (index, context) =>
                                      const SizedBox(
                                        width: 20,
                                      ),
                                  itemCount:
                                      state.movieResponseModel?.data.length ??
                                          0),
                            ),
                          ],
                        ),
                      )
                ],
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
