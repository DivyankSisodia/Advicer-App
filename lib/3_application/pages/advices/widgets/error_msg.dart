import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  String message;
  ErrorMsg({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.redAccent, 
          size: 50
        ),
        const SizedBox(height: 20),
        Text(message, style: themeData.textTheme.bodyLarge)
      ],
    );
  }
}