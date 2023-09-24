import 'package:advicer_app/3_application/core/services/theme_services.dart';
import 'package:advicer_app/3_application/pages/advices/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal:50),
        child: Column(
          children: [
            Expanded(child: Placeholder()),
            SizedBox(
              height:200,
              child:Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}