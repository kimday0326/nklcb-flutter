import 'package:flutter/material.dart';
import 'package:nklcb/app_colors.dart';
import 'package:nklcb/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainPage();
  }

  _navigateToMainPage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String fontFamily = 'NanumSquare';
    const double fontSize = 50.0;
    const FontWeight fontWeight = FontWeight.bold;

    TextStyle textStyle(Color color) {
      return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
    }

    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '네',
                style: textStyle(AppColors.naverGreen),
              ),
              TextSpan(
                text: '카',
                style: textStyle(AppColors.kakaoYellow),
              ),
              TextSpan(
                text: '라',
                style: textStyle(AppColors.lineGreen),
              ),
              TextSpan(
                text: '쿠',
                style: textStyle(AppColors.coupangRed),
              ),
              TextSpan(
                text: '배',
                style: textStyle(AppColors.woowaTurquoise),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
