import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/home/data/model/popular_model.dart';
import 'package:movie/features/home/data/repo/home_repo.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit(this.homeRepo) : super(PopularMovieInitial());
  final HomeRepo homeRepo;

  fetchPopularMovie() async {
    emit(PopularMovieLoading());
    var result = await homeRepo.featchPopularMovie();
    result.fold((failuer) {
      emit(PopularMovieFailuer(failuer.errorMessage));
    }, (popular) {
      emit(PopularMovieSuccess(popular));
    });
  }
}
