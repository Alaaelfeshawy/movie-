
import 'package:get_it/get_it.dart';
import '../data/search_repository.dart';
import '../logic/search/search_cubit.dart';


class SearchDi {
  SearchDi(
    this.di, {
        SearchRepository? repository,
  }) {
    call(repository);
  }

  final GetIt di;

  void call(SearchRepository? repository) {
    di
      ..registerFactory(() => SearchCubit(di()))
      ..registerFactory(
        () => repository ?? SearchRepository(di()),
      );
  }
}
