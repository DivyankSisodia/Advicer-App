import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerCubitInitial());

  void AdviceRequested() async{
    emit(AdvicerCubitStateLoading());

      // executing the business logic
      // for example get an advice from an API

      debugPrint('fake trigger to get an advice from an API');
      await Future.delayed(const Duration(seconds: 3));
      debugPrint('got triggered');
      emit(AdvicerCubitStateLoaded(advice: 'fake advice'));
  }

}
