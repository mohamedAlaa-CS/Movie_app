import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/home/data/model/new.model.dart';
import 'package:movie/features/home/data/repo/home_repo.dart';

part 'new_relase_state.dart';

class NewRelaseCubit extends Cubit<NewRelaseState> {
  NewRelaseCubit(this.homeRepo) : super(NewRelaseInitial());
  final HomeRepo homeRepo;

  featchNewRelase() async {
    emit(NewRelaseLoading());
    var result = await homeRepo.featchNewRelase();
    result.fold((failuer) {
      emit(NewRelaseFailuer(failuer.errorMessage));
    }, (newRelaselist) {
      emit(NewRelaseSuccess(newRelaselist));
    });
  }
}
