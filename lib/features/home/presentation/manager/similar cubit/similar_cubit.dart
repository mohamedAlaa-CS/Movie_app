import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo.dart';
import 'package:movie/models/movie_model.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeDetailsRepo) : super(SimilarInitial());
  final HomeDetailsRepo homeDetailsRepo;

  static SimilarCubit get(context) => BlocProvider.of<SimilarCubit>(context);

  //! change changeWatchList
  // List<int> selectedItemToWatchList = [];

  // changeWatchList(index) {
  //   if (selectedItemToWatchList.contains(index)) {
  //     selectedItemToWatchList.remove(index);
  //     emit(SimilarRemoveFromWatchList());
  //   } else {
  //     selectedItemToWatchList.add(index);
  //     emit(SimilarAddTowatchList());
  //   }
  // }

  //! featch similar movie list
  List<MovieModel> similarMovieList = [];

  featchSimailar({required int id}) async {
    emit(SimilarLoading());
    var result = await homeDetailsRepo.featchSimilarMovie(id: id);
    result.fold((failuer) {
      emit(SimilarFailuer(failuer.errorMessage));
    }, (similarList) {
      similarMovieList.addAll(similarList);
      emit(SimilarSuccess());
    });
  }
}
