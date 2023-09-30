part of 'advicer_cubit.dart';

@immutable
sealed class AdvicerCubitState {}

final class AdvicerCubitInitial extends AdvicerCubitState {}

final class AdvicerCubitStateLoading extends AdvicerCubitState {}

final class AdvicerCubitStateLoaded extends AdvicerCubitState {
  final String advice;
  AdvicerCubitStateLoaded({required this.advice});
}

final class AdvicerCubitStateError extends AdvicerCubitState {
  final String errormsg;
  AdvicerCubitStateError({required this.errormsg});
}
