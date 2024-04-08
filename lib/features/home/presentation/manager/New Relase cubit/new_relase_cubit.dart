import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/repos/home%20repo/home_repo.dart';
import 'package:movie/models/movie_model.dart';

part 'new_relase_state.dart';

class NewRelaseCubit extends Cubit<NewRelaseState> {
  NewRelaseCubit(this.homeRepo) : super(NewRelaseInitial());
  final HomeRepo homeRepo;

  static NewRelaseCubit get(context) => BlocProvider.of(context);

//!featch new relase
  List<MovieModel> newRelaseList = [];

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
