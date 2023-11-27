part of 'new_relase_cubit.dart';

sealed class NewRelaseState extends Equatable {
  const NewRelaseState();

  @override
  List<Object> get props => [];
}

final class NewRelaseInitial extends NewRelaseState {}

final class NewRelaseLoading extends NewRelaseState {}

final class NewRelaseSuccess extends NewRelaseState {
  final List<NewModel> newRelaselist;

  const NewRelaseSuccess(this.newRelaselist);
}

final class NewRelaseFailuer extends NewRelaseState {
  final String errorMessage;

  const NewRelaseFailuer(this.errorMessage);
}
