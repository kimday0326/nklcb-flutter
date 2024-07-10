import 'package:flutter/material.dart';
import 'package:nklcb/constants/app_colors.dart';
import 'package:nklcb/pages/splash_screen.dart';

void main() {
  runApp(const NKLCBApp());
}

class NKLCBApp extends StatelessWidget {
  const NKLCBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NKLCB',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: 'NanumSquare',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ).copyWith(
          secondary: Colors.grey[400],
          surface: Colors.grey[100],
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
