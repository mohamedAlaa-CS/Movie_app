part of 'similar_cubit.dart';

sealed class SimilarState extends Equatable {
  const SimilarState();

  @override
  List<Object> get props => [];
}

final class SimilarInitial extends SimilarState {}

final class SimilarLoading extends SimilarState {}

final class SimilarSuccess extends SimilarState {}

final class SimilarFailuer extends SimilarState {
  final String errorMessage;

  const SimilarFailuer(this.errorMessage);
}
