import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/search/data/repos/search_repo.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_state.dart';
import 'package:movie/models/movie_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);

  //! featch search data
  List<MovieModel> searchData = [];

  featchSearch({required String query}) async {
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

  //! featch Category search data
  List<MovieModel> categorySearchData = [];

  featchCategorySearch({required String query}) async {
    emit(CategorySearchLoading());
    categorySearchData = [];
    var result = await searchRepo.featchSearch(query: query);
    result.fold((failer) {
      emit(CategorySearchFailuer(failer.errorMessage));
    }, (searchList) {
      categorySearchData.addAll(searchList);
      emit(CategorySearchSuccess(searchList));
    });
  }
}
