import 'package:equatable/equatable.dart';
import 'package:movie/home/data/model/home/movie_data.dart';

import '../../../../core/data/api_manager.dart';


class MovieResponseModel extends Equatable implements ResponseModel {
  const MovieResponseModel({
    required this.data,
  });

  factory MovieResponseModel.fromMap(Map<String, dynamic> map) {
    return MovieResponseModel(
      data:  map['results'] != null
          ? List<MovieData>.from(
        map['results']?.map(
              (x) => MovieData.fromMap(x),
        ),
      )
          : [],
    );
  }

  final List<MovieData> data;

  Map<String, dynamic> toMap() => {
    'results': data.map((x) => x.toMap()).toList(),
  };


  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        data,
      ];
}
