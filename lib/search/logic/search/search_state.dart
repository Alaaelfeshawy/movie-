part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.loading = false,
    this.failure,
    this.movieResponseModel,
  });

  final bool loading;
  final Failure? failure;
  final MovieResponseModel? movieResponseModel;

  SearchState requestSearchResponseModel(MovieResponseModel response) =>
      copyWith(
        loading: false,
        movieResponseModel: Nullable(response),
      );

  SearchState requestFailed(Failure failure) => copyWith(
        loading: false,
        failure: Nullable(failure),
      );

  SearchState requestLoading() => copyWith(
        loading: true,
        failure: Nullable(null),
      );

  SearchState requestPageLoading() => copyWith(
        pagingLoading: true,
        failure: Nullable(null),
      );

  SearchState copyWith({
    bool? loading,
    Nullable<Failure?>? failure,
    Nullable<MovieResponseModel?>? movieResponseModel,
    bool? pagingLoading,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      failure: failure == null ? this.failure : failure.value,
      movieResponseModel: movieResponseModel == null
          ? this.movieResponseModel
          : movieResponseModel.value,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        failure,
        movieResponseModel,
      ];

  @override
  bool get stringify => true;
}
