import 'package:equatable/equatable.dart';
import 'package:movie/home/data/model/home/movie_data.dart';
import 'package:movie/movie_details/data/model/movie/video_data.dart';

import '../../../../core/data/api_manager.dart';


class VideoResponseModel extends Equatable implements ResponseModel {
  const VideoResponseModel({
    required this.data,
  });

  factory VideoResponseModel.fromMap(Map<String, dynamic> map) {
    return VideoResponseModel(
      data:  map['results'] != null
          ? List<VideoData>.from(
        map['results']?.map(
              (x) => VideoData.fromMap(x),
        ),
      )
          : [],
    );
  }

  final List<VideoData> data;

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
