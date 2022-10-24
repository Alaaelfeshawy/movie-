import 'package:equatable/equatable.dart';

class VideoData extends Equatable {
  const VideoData(
  {
    this.name,
    this.key,
    this.publishedAt,
});

  factory VideoData.fromMap(Map<String, dynamic> map) {
    return VideoData(
      name: map['name'] ,
      key: map['key'] ,
      publishedAt: map['published_at'] ,
    );
  }

  final String? name ;
  final String? key ;
  final String? publishedAt;


  VideoData copyWith({
     String? name,
     String? key,
     String? publishedAt,
  }) {
    return VideoData(
       name:name??this.name,
       key:key ?? this.key ,
       publishedAt : publishedAt ?? this.publishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name':name ,
      'key':key,
      'published_at':publishedAt,

    };
  }

  @override
  List<Object?> get props {
    return [
      name ,
      key,
      publishedAt,
    ];
  }


}
