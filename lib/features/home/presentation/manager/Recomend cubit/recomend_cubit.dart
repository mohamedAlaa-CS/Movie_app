import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/model/recomend_model.dart';
import 'package:movie/features/home/data/repos/home%20repo/home_repo.dart';

part 'recomend_state.dart';

class RecomendCubit extends Cubit<RecomendState> {
  RecomendCubit(this.homeRepo) : super(RecomendInitial());
  final HomeRepo homeRepo;
  static RecomendCubit get(context) => BlocProvider.of<RecomendCubit>(context);

  //! featch recomend movie
  List<RecomendModel> recomendMovieList = [];

  featchRecomendMovie() async {
    emit(RecomendLoading());
    var result = await homeRepo.feactchRecomendMovie();
    result.fold((failuer) {
      emit(RecomendFailure(failuer.errorMessage));
    }, (recomendList) {
      recomendMovieList.addAll(recomendList);
      emit(RecomendSuccess());
    });
  }
}
