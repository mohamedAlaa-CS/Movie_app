import 'package:movie/features/search/data/models/search_model.dart';

class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailuer extends SearchState {
  final String errorMessage;

  SearchFailuer(this.errorMessage);
}

final class SearchSuccess extends SearchState {
  final List<SearchModel> searchData ;

  SearchSuccess(this.searchData);
}

final class SearchListIsEmpty extends SearchState {}

final class SearchListNotEmpty extends SearchState {}
