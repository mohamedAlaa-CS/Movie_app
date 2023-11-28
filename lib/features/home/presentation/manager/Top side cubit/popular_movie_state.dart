part of 'popular_movie_cubit.dart';

sealed class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

final class PopularMovieInitial extends PopularMovieState {}

final class PopularMovieLoading extends PopularMovieState {}

final class PopularMovieSuccess extends PopularMovieState {}

final class PopularMovieFailuer extends PopularMovieState {
  final String errorMessage;

  const PopularMovieFailuer(this.errorMessage);
}

final class PopularMovieAddToWatchList extends PopularMovieState {}

final class PopularMovieRemoveFormWatchList extends PopularMovieState {}
