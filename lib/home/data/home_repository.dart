import 'package:dartz/dartz.dart';
import 'package:movie/home/data/request/home_now_playing_request.dart';
import 'package:movie/home/data/request/home_up_coming_request.dart';

import '../../core/data/api_manager.dart';
import 'model/home/movie_response_model.dart';
import 'request/home_top_rated_request.dart';

class HomeRepository {
  HomeRepository(this._apIsManager);

  final APIsManager _apIsManager;

  Future<Either<Failure, MovieResponseModel>>
      getTopRatedMovies() async {
    final response = await _apIsManager.send(
      request: TopRatedRequest(),
      responseFromMap: (map) => MovieResponseModel.fromMap(map),
    );
    return response;
  }

  Future<Either<Failure, MovieResponseModel>>
  getNowPlayingMovies() async {
    final response = await _apIsManager.send(
      request: NowPlayingRequest(),
      responseFromMap: (map) => MovieResponseModel.fromMap(map),
    );
    return response;
  }

  Future<Either<Failure, MovieResponseModel>>
  getUpcomingMovies() async {
    final response = await _apIsManager.send(
      request: UpcomingMoviesRequest(),
      responseFromMap: (map) => MovieResponseModel.fromMap(map),
    );
    return response;
  }
}
