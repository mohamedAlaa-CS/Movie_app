import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/model/recomend_model.dart';
import 'package:movie/features/home/data/repo/home_repo.dart';

part 'recomend_state.dart';

class RecomendCubit extends Cubit<RecomendState> {
  RecomendCubit(this.homeRepo) : super(RecomendInitial());
  bool checked = false;
  static RecomendCubit get(context) => BlocProvider.of<RecomendCubit>(context);
  changeMarker() {
    checked = !checked;
    //emit(RecomendChangeMarker());
  }

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
