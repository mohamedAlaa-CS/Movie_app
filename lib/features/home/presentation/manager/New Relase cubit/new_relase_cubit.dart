import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/model/new.model.dart';
import 'package:movie/features/home/data/repo/home_repo.dart';

part 'new_relase_state.dart';

class NewRelaseCubit extends Cubit<NewRelaseState> {
  NewRelaseCubit(this.homeRepo) : super(NewRelaseInitial());
  final HomeRepo homeRepo;

  static NewRelaseCubit get(context) => BlocProvider.of(context);
//! change changeWatchList
  List<int> selectedItemToWatchList = [];

  changeWatchList(index) {
    if (selectedItemToWatchList.contains(index)) {
      emit(NewRelaseRemoveToWactchList());
      selectedItemToWatchList.remove(index);
    } else {
      emit(NewRelaseAddToWactchList());
      selectedItemToWatchList.add(index);
    }
  }

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
