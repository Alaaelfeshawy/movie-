import '../../../../core/data/api_manager.dart';

class MovieDetailsRequestModel extends RequestModel {
  MovieDetailsRequestModel({
    required this.id,
    RequestProgressListener? progressListener,
  }) : super(progressListener);

  final int? id;

  @override
  Future<Map<String, dynamic>> toMap() async {
    final map = <String, dynamic>{
      'movie_id':id ?? 0,
    };
    return map;
  }

  @override
  List<Object?> get props => [
    id,
  ];

  MovieDetailsRequestModel copyWith({
    int? id,
  }) {
    return MovieDetailsRequestModel(
      id: id ?? this.id,
    );
  }
}
