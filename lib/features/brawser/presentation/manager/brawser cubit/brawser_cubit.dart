import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/brawser/data/models/categoryname/genre.dart';
import 'package:movie/features/brawser/data/repos/brawser_repo.dart';
import 'package:movie/features/brawser/presentation/manager/brawser%20cubit/brawser_state.dart';

class BrawserCubit extends Cubit<BrawserState> {
  BrawserCubit(this.brawserRepo) : super(BrawserInitial());
  final BrawserRepo brawserRepo;
  static BrawserCubit get(context) => BlocProvider.of(context);

  //! fetch category names
  List<CategoryModel> categoryNames = [];
  fetchCategoryNames() async {
    emit(BrawserLoadingState());
    var result = await brawserRepo.fetchCategoryName();
    result.fold((failuer) {
      emit(BrawserFailuerState(errorMessage: failuer.errorMessage));
    }, (categoryList) {
      emit(BrawserSuccessState());
      categoryNames.addAll(categoryList);
    });
  }
}
