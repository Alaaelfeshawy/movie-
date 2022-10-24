import '../../../core/data/api_manager.dart';

class SearchRequest with Request, GetRequest {
  final String query;

  SearchRequest(this.query);

  @override
  Future<Map<String, dynamic>?> get queryParameters async {
    super.queryParameters;
    return  {"api_key": "1fd478cb82068e8bcf12172ab61d25be" , "query":"$query"};
  }
  @override
  String get path => 'search/movie';
}
