import '../../../core/data/api_manager.dart';
import '../model/movie/movie_details_request_model.dart';

class MovieDetailsRequest with Request, GetRequest {
  MovieDetailsRequest({
    required this.requestModel,
  });

  @override
  Future<Map<String, dynamic>?> get queryParameters async {
    super.queryParameters;
    return  {"api_key": "1fd478cb82068e8bcf12172ab61d25be"};
  }

  @override
  String get path => 'movie/${requestModel.id}';

  @override
  MovieDetailsRequestModel requestModel;
}