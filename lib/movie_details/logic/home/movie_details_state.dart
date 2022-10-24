part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.loading = false,
    this.failure,
    this.response,
    this.model
  });

  final bool loading;
  final Failure? failure;
  final MovieData? response;
  final VideoResponseModel? model;

  MovieDetailsState requestMovieDetailsResponseModel(MovieData response) =>
      copyWith(
        loading: false,
        response: Nullable(response),
      );
  MovieDetailsState requestVideoResponseModel(VideoResponseModel response) =>
      copyWith(
        loading: false,
        model: Nullable(response),
      );
  MovieDetailsState requestFailed(Failure failure) => copyWith(
        loading: false,
        failure: Nullable(failure),
      );

  MovieDetailsState requestLoading() => copyWith(
        loading: true,
        failure: Nullable(null),
      );

  MovieDetailsState requestPageLoading() => copyWith(
        pagingLoading: true,
        failure: Nullable(null),
      );

  MovieDetailsState copyWith({
    bool? loading,
    Nullable<Failure?>? failure,
    Nullable<MovieData?>? response,
    bool? pagingLoading,
    Nullable<VideoResponseModel>? model
  }) {
    return MovieDetailsState(
      loading: loading ?? this.loading,
      failure: failure == null ? this.failure : failure.value,
      response: response == null
          ? this.response
          : response.value,
     model: model == null ? this.model
        : model.value
    );
  }

  @override
  List<Object?> get props => [
        loading,
        failure,
        response,
    model,
      ];

  @override
  bool get stringify => true;
}
