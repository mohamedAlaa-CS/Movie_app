import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/model/new.model.dart';
import 'package:movie/features/home/data/repos/home%20repo/home_repo.dart';

part 'new_relase_state.dart';

class NewRelaseCubit extends Cubit<NewRelaseState> {
  NewRelaseCubit(this.homeRepo) : super(NewRelaseInitial());
  final HomeRepo homeRepo;

  static NewRelaseCubit get(context) => BlocProvider.of(context);

//!featch new relase
  List<NewModel> newRelaseList = [];

  featchNewRelase() async {
    emit(NewRelaseLoading());
    var result = await homeRepo.featchNewRelase();
    result.fold((failuer) {
      emit(NewRelaseFailuer(failuer.errorMessage));
    }, (newRelaselist) {
      emit(NewRelaseSuccess());
      newRelaseList.addAll(newRelaselist);
    });
  }
}
