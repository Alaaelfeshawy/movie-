import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/failures.dart';
import '../../../core/data/models/request_model.dart';
import '../../../core/utils/nullable.dart';
import '../../data/home_repository.dart';
import '../../data/model/home/movie_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._repository,
  ) : super(const HomeState());

  final HomeRepository _repository;
  RequestModel? requestModel;

  Future<void> getTopRatedMovies() async {
    _getTopRatedMovies();
  }

  Future<void> _getTopRatedMovies() async {
    emit(state.requestLoading());
    final result = await _repository.getTopRatedMovies();
    emit(result.fold(
      (l) => state.requestFailed(l),
      (r) {
        return state.requestTopRatedResponseModel(r);
      },
    ));
  }

  Future<void> getNowPlayingMovies() async {
    _getNowPlayingMovies();
  }

  Future<void> _getNowPlayingMovies() async {
    emit(state.requestLoading());
    final result = await _repository.getNowPlayingMovies();
    emit(result.fold(
          (l) => state.requestFailed(l),
          (r) {
        return state.requestNowPlayingResponseModel(r);
      },
    ));
  }

  Future<void> getUpcomingMovies() async {
    _getUpcomingMovies();
  }

  Future<void> _getUpcomingMovies() async {
    emit(state.requestLoading());
    final result = await _repository.getUpcomingMovies();
    emit(result.fold(
          (l) => state.requestFailed(l),
          (r) {
        return state.requestUpcomingModel(r);
      },
    ));
  }
  void retry() {
    getTopRatedMovies();
  }

  void refresh() {
    emit(state.copyWith(movieResponseModel: Nullable(null)));
    getTopRatedMovies();
  }

}