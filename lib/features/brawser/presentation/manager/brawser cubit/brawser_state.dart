class BrawserState {}

final class BrawserInitial extends BrawserState {}

final class BrawserLoadingState extends BrawserState {}

final class BrawserSuccessState extends BrawserState {}

final class BrawserFailuerState extends BrawserState {
  final String errorMessage;

  BrawserFailuerState({required this.errorMessage});
}
