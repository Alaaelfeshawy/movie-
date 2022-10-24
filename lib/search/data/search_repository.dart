import 'package:dartz/dartz.dart';
import 'package:movie/home/data/request/home_now_playing_request.dart';
import 'package:movie/home/data/request/home_up_coming_request.dart';
import 'package:movie/search/data/request/search_request.dart';

import '../../core/data/api_manager.dart';
import '../../home/data/model/home/movie_response_model.dart';

class SearchRepository {
  SearchRepository(this._apIsManager);

  final APIsManager _apIsManager;

  Future<Either<Failure, MovieResponseModel>>
      search(String query) async {
    final response = await _apIsManager.send(
      request: SearchRequest(query),
      responseFromMap: (map) => MovieResponseModel.fromMap(map),
    );
    return response;
  }
}
