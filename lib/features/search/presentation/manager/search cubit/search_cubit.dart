import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/search/data/models/search_model.dart';
import 'package:movie/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  //! featch search data
  List<SearchModel> searchData = [];

  featchSearch({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.featchSearch(query: query);
    result.fold((failer) {
      emit(SearchFailuer(failer.errorMessage));
    }, (searchList) {
      searchData.addAll(searchList);
      emit(SearchSuccess());
    });
  }
}
