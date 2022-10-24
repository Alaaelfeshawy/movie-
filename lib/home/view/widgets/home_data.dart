
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/home/home_cubit.dart';
import 'movie_list_widget.dart';

class HomeData extends StatefulWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  State<HomeData> createState() => HomeDataState();
}

class HomeDataState extends State<HomeData> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context , state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieListWidget(
                    title: "Top Rated",
                    model: state.movieResponseModel),
                MovieListWidget(
                    title: "Now Playing",
                    model: state.nowPlayingResponse),
                MovieListWidget(
                    title: "Soon",
                    model: state.upComingResponseModel),
              ],
            ),
          );
        }
    );
  }
}
