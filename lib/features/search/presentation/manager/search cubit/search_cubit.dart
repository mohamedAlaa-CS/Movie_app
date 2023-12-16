import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/search/data/models/search_model.dart';
import 'package:movie/features/search/data/repos/search_repo.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);

  //! featch search data
  List<SearchModel> searchData = [];
  bool changeUi = false;
  featchSearch({required String query}) async {
    changeUi = true;
    emit(SearchLoading());
    searchData = [];
    var result = await searchRepo.featchSearch(query: query);
    result.fold((failer) {
      emit(SearchFailuer(failer.errorMessage));
    }, (searchList) {
      searchData.addAll(searchList);
      emit(SearchSuccess(searchList));
    });
  }

  changeUiInSearch() {
    if (searchData.isEmpty) {
      changeUi = false;
      emit(SearchListIsEmpty());
    } else {
      changeUi = true;
      emit(SearchListNotEmpty());
    }
  }
}
