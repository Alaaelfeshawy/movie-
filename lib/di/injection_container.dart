
import 'package:get_it/get_it.dart';
import 'package:movie/core/di/core_di.dart';
import 'package:movie/home/di/home_di.dart';
import 'package:movie/home/logic/home/home_cubit.dart';
import 'package:movie/movie_details/data/movie_details_repository.dart';
import 'package:movie/movie_details/di/movie_di.dart';
import 'package:movie/search/data/search_repository.dart';
import 'package:movie/search/di/search_di.dart';

import '../home/data/home_repository.dart';

final di = GetIt.instance;

void initDependencyInjection(
{
  HomeRepository? homeRepository,
  MovieDetailsRepository? movieDetailsRepository,
  SearchRepository?searchRepository,

}
) {
  CoreDI(di);
  HomeDI(di, repository: homeRepository);
  MovieDI(di, repository: movieDetailsRepository);
  SearchDi(di, repository: searchRepository);

}
