import 'package:dartz/dartz.dart';
import 'package:movie/home/data/model/home/movie_data.dart';
import 'package:movie/movie_details/data/model/movie/movie_details_request_model.dart';
import 'package:movie/movie_details/data/model/movie/video_response_model.dart';
import 'package:movie/movie_details/data/request/movie_details_request.dart';
import 'package:movie/movie_details/data/request/video_request.dart';

import '../../core/data/api_manager.dart';

class MovieDetailsRepository {
  MovieDetailsRepository(this._apIsManager);

  final APIsManager _apIsManager;

  Future<Either<Failure, MovieData>>
      getMovieDetails(MovieDetailsRequestModel requestModel) async {
    final response = await _apIsManager.send(
      request: MovieDetailsRequest(requestModel: requestModel),
      responseFromMap: (map) => MovieData.fromMap(map),
    );
    return response;
  }


  Future<Either<Failure, VideoResponseModel>>
  getVideo(MovieDetailsRequestModel requestModel) async {
    final response = await _apIsManager.send(
      request: VideoRequest(requestModel: requestModel),
      responseFromMap: (map) => VideoResponseModel.fromMap(map),
    );
    return response;
  }
}
