import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/home/data/model/details/details.model.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final HomeDetailsRepo homeDetailsRepo;
  DetailsCubit(this.homeDetailsRepo) : super(DetailsInitial());

  //! featch details
  late DetailsModel detailsModel;
  featchDetails(query) async {
    emit(DetailsLoading());
    var result = await homeDetailsRepo.featchDetails(query: query);
    result.fold((failuer) {
      emit(DetailsFailuer(failuer.errorMessage));
    }, (details) {
      detailsModel = details;
      emit(DetailsSuccess());
    });
  }
}
