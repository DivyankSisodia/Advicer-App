// ignore_for_file: unused_import

import 'package:advicer_app/3_application/core/services/theme_services.dart';
import 'package:advicer_app/3_application/pages/advices/bloc/advicer_bloc.dart';
import 'package:advicer_app/3_application/pages/advices/cubit/advicer_cubit.dart';
import 'package:advicer_app/3_application/pages/advices/widgets/advice_field.dart';
import 'package:advicer_app/3_application/pages/advices/widgets/custom_btn.dart';
import 'package:advicer_app/3_application/pages/advices/widgets/error_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerCubit(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
                builder: (context, state) {
                  if (state is AdvicerCubitInitial) {
                    return Text(
                      'Your advice will appear here',
                      style: themeData.textTheme.titleLarge,
                    );
                  } else if (state is AdvicerCubitStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary,
                    );
                  }
                  else if(state is AdvicerCubitStateLoaded){
                    return AdviceField(
                      advice: state.advice,
                    );
                  }
                  else if(state is AdvicerCubitStateError){
                    return ErrorMsg(
                      message: state.errormsg,
                    );
                  }
                  return const SizedBox();
                },
              )),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
