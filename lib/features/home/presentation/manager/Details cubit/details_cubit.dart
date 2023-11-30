import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/model/details/details.model.dart';
import 'package:movie/features/home/data/repos/home%20details%20repo/home_details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final HomeDetailsRepo homeDetailsRepo;
  DetailsCubit(this.homeDetailsRepo) : super(DetailsInitial());
  static DetailsCubit get(context) => BlocProvider.of<DetailsCubit>(context);
  //! featch details
  late DetailsModel detailsModel;

  featchDetails(query) async {
    emit(DetailsLoading());
    var result = await homeDetailsRepo.featchDetails(id: query);
    result.fold((failuer) {
      emit(DetailsFailuer(failuer.errorMessage));
    }, (details) {
      detailsModel = details;
      emit(DetailsSuccess());
    });
  }
}
