
import '../logic/home/movie_details_cubit.dart';
import 'package:get_it/get_it.dart';

import '../data/movie_details_repository.dart';


class MovieDI {
  MovieDI(
    this.di, {
    MovieDetailsRepository? repository,
  }) {
    call(repository);
  }

  final GetIt di;

  void call(MovieDetailsRepository? repository) {
    di
      ..registerFactory(() => MovieDetailsCubit(di()))
      ..registerFactory(
        () => repository ?? MovieDetailsRepository(di()),
      );
  }
}
