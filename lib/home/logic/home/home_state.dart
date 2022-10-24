part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.loading = false,
    this.failure,
    this.movieResponseModel,
    this.nowPlayingResponse,
    this.upComingResponseModel
  });

  final bool loading;
  final Failure? failure;
  final MovieResponseModel? movieResponseModel;
  final MovieResponseModel? nowPlayingResponse;
  final MovieResponseModel? upComingResponseModel;

  HomeState requestTopRatedResponseModel(MovieResponseModel response) =>
      copyWith(
        loading: false,
        movieResponseModel: Nullable(response),
      );
  HomeState requestNowPlayingResponseModel(MovieResponseModel response) =>
      copyWith(
        loading: false,
        nowPlayingResponse: Nullable(response),
      );
  HomeState requestUpcomingModel(MovieResponseModel response) =>
      copyWith(
        loading: false,
        upComingResponseModel: Nullable(response),
      );

  HomeState requestFailed(Failure failure) => copyWith(
        loading: false,
        failure: Nullable(failure),
      );

  HomeState requestLoading() => copyWith(
        loading: true,
        failure: Nullable(null),
      );

  HomeState requestPageLoading() => copyWith(
        pagingLoading: true,
        failure: Nullable(null),
      );

  HomeState copyWith({
    bool? loading,
    Nullable<Failure?>? failure,
    Nullable<MovieResponseModel?>? movieResponseModel,
    Nullable<MovieResponseModel>? nowPlayingResponse,
    Nullable<MovieResponseModel>? upComingResponseModel,
    bool? pagingLoading,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure == null ? this.failure : failure.value,
      movieResponseModel: movieResponseModel == null
          ? this.movieResponseModel
          : movieResponseModel.value,
      nowPlayingResponse: nowPlayingResponse == null
          ? this.nowPlayingResponse
          : nowPlayingResponse.value,
      upComingResponseModel: upComingResponseModel == null
          ? this.upComingResponseModel
          : upComingResponseModel.value,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        failure,
        movieResponseModel,
        nowPlayingResponse,
        upComingResponseModel,
      ];

  @override
  bool get stringify => true;
}
