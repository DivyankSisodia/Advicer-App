import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      // executing the business logic
      // for example get an advice from an API

      debugPrint('fake trigger to get an advice from an API');
      await Future.delayed(const Duration(seconds: 3));
      debugPrint('got triggered');
      emit(AdvicerStateLoaded(advice: 'fake advice'));
    });
  }
}
