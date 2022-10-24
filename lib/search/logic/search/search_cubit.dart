import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/failures.dart';
import '../../../core/data/models/request_model.dart';
import '../../../core/utils/nullable.dart';
import '../../../home/data/model/home/movie_response_model.dart';
import '../../data/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this._repository,
  ) : super(const SearchState());

  final SearchRepository _repository;
  RequestModel? requestModel;

  Future<void> search(String query) async {
    _search(query);
  }

  Future<void> _search(String query) async {
    emit(state.requestLoading());
    final result = await _repository.search(query);
    emit(result.fold(
      (l) => state.requestFailed(l),
      (r) {
        return state.requestSearchResponseModel(r);
      },
    ));
  }

  void retry() {
  }


}