import '../../../core/data/api_manager.dart';

class UpcomingMoviesRequest with Request, GetRequest {
  @override
  Future<Map<String, dynamic>?> get queryParameters async {
    super.queryParameters;
    return  {"api_key": "1fd478cb82068e8bcf12172ab61d25be"};
  }
  @override
  String get path => 'movie/upcoming';
}
