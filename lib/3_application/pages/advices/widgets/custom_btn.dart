import 'package:advicer_app/3_application/pages/advices/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () {
        // for bloc
        // BlocProvider.of<AdvicerBloc>(context).add(AdvicerRequestEvent());

        // for cubit
        BlocProvider.of<AdvicerCubit>(context).AdviceRequested();
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
