import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/repos/home%20repo/home_repo.dart';
import 'package:movie/models/movie_model.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit(this.homeRepo) : super(PopularMovieInitial());
  final HomeRepo homeRepo;

  static PopularMovieCubit get(context) => BlocProvider.of(context);
//! change mark to watch List view
  List<int> selectedItemToWatchList = [];

  changeWatchList(index) {
    if (selectedItemToWatchList.contains(index)) {
      selectedItemToWatchList.remove(index);
      emit(PopularMovieRemoveFormWatchList());
    } else {
      selectedItemToWatchList.add(index);
      emit(PopularMovieAddToWatchList());
    }
  }

//! featch popular movie
  List<MovieModel> popularMovieList = [];

  fetchPopularMovie() async {
    emit(PopularMovieLoading());
    var result = await homeRepo.featchPopularMovie();
    result.fold((failuer) {
      emit(PopularMovieFailuer(failuer.errorMessage));
    }, (popular) {
      popularMovieList.addAll(popular);
      emit(PopularMovieSuccess());
    });
  }
}
