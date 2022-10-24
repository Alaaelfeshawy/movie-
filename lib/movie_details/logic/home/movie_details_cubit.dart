import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/home/data/model/home/movie_data.dart';
import 'package:movie/movie_details/data/model/movie/movie_details_request_model.dart';

import '../../../core/data/failures.dart';
import '../../../core/data/models/request_model.dart';
import '../../../core/utils/nullable.dart';
import '../../data/model/movie/video_response_model.dart';
import '../../data/movie_details_repository.dart';
part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(
    this._repository,
  ) : super(const MovieDetailsState());

  final MovieDetailsRepository _repository;
  RequestModel? requestModel;

  Future<void> getMovieDetails(int id) async {
    _getTopRatedMovies(id);
  }

  Future<void> _getTopRatedMovies(int? id) async {
    MovieDetailsRequestModel requestModel = MovieDetailsRequestModel(id: id);
    this.requestModel = requestModel;
    emit(state.requestLoading());
    final result = await _repository.getMovieDetails(requestModel);
    emit(result.fold(
      (l) => state.requestFailed(l),
      (r) {
        return state.requestMovieDetailsResponseModel(r);
      },
    ));
  }

  Future<void> getVideo(int id) async {
    _getVideo(id);
  }

  Future<void> _getVideo(int? id) async {
    MovieDetailsRequestModel requestModel = MovieDetailsRequestModel(id: id);
    this.requestModel = requestModel;
    emit(state.requestLoading());
    final result = await _repository.getVideo(requestModel);
    emit(result.fold(
          (l) => state.requestFailed(l),
          (r) {
        return state.requestVideoResponseModel(r);
      },
    ));
  }
  void retry() {
  }

}