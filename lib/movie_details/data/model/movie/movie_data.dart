import 'package:equatable/equatable.dart';

class MovieData extends Equatable {
  const MovieData(
  {
    this.backdropPath,
    // this.genreIds,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.adult
});

  factory MovieData.fromMap(Map<String, dynamic> map) {
    return MovieData(
      id: map['id'] ,
      title: map['title'] ,
      adult: map['adult'] ,
      backdropPath: map['backdrop_path'],
      // genreIds: map['genre_ids'] ,
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }

  final bool? adult;
  final String? backdropPath ;
  // final List<int>? genreIds;
  final int? id ;
  final String? originalTitle;
  final String? overview ;
  final dynamic? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final dynamic? voteAverage;
  final int? voteCount ;

  MovieData copyWith({
     bool? adult,
     String? backdropPath ,
     // List<int>? genreIds,
     int? id ,
     String? originalTitle,
     String? overview ,
     double? popularity,
     String? posterPath,
     String? releaseDate,
     String? title,
     bool? video,
     double? voteAverage,
     int? voteCount,
  }) {
    return MovieData(
       adult:adult??this.adult,
       backdropPath:backdropPath ?? this.backdropPath ,
       // genreIds : genreIds ?? this.genreIds,
       id : id ?? this.id,
       originalTitle : originalTitle ?? this.originalTitle,
       overview : overview?? this.overview ,
       popularity : popularity?? this.popularity ,
       posterPath : posterPath ?? this.posterPath,
       releaseDate : releaseDate ?? this.releaseDate,
       title : title ?? this.title,
       video : video ?? this.video,
       voteAverage : voteAverage ?? this.voteAverage,
       voteCount : voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id ,
      'title':title,
      'adult':adult,
      'backdrop_path':backdropPath,
      // 'genre_ids':genreIds ,
      'original_title':originalTitle,
      'overview':overview,
      'popularity':popularity,
      'poster_path':posterPath,
      'release_date':releaseDate,
      'video':video,
      'vote_average':voteAverage,
      'vote_count':voteCount,
    };
  }

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      // genreIds,
      id,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount
    ];
  }


}
