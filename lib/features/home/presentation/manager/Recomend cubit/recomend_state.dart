part of 'recomend_cubit.dart';

sealed class RecomendState extends Equatable {
  const RecomendState();

  @override
  List<Object> get props => [];
}

final class RecomendInitial extends RecomendState {}

final class RecomendLoading extends RecomendState {}

final class RecomendSuccess extends RecomendState {}

final class RecomendFailure extends RecomendState {
  final String errorMessage;

  const RecomendFailure(this.errorMessage);
}

final class RecomendChangeAddToWatchListView extends RecomendState {}

final class RecomendChangeRemoveFromWatchListView extends RecomendState {}
