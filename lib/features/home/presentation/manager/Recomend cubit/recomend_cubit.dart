import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/home/data/model/recomend_model.dart';
import 'package:movie/features/home/data/repo/home_repo.dart';

part 'recomend_state.dart';

class RecomendCubit extends Cubit<RecomendState> {
  RecomendCubit(this.homeRepo) : super(RecomendInitial());
  final HomeRepo homeRepo;
  featchRecomendMovie() async {
    emit(RecomendLoading());
    var result = await homeRepo.feactchRecomendMovie();
    result.fold((failuer) {
      emit(RecomendFailure(failuer.errorMessage));
    }, (recomendList) {
      emit(RecomendSuccess(recomendList));
    });
  }
}
