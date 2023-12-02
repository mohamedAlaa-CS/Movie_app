part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailuer extends SearchState {
  final String errorMessage;

  const SearchFailuer(this.errorMessage);
}

final class SearchSuccess extends SearchState {}
