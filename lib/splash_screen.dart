import 'package:flutter/material.dart';
import 'package:nklcb/company_colors.dart';
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

    const Map<String, Color> colors = CompanyColors.colors;

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
                style: textStyle(colors['NAVER']!),
              ),
              TextSpan(
                text: '카',
                style: textStyle(colors['KAKAO']!),
              ),
              TextSpan(
                text: '라',
                style: textStyle(colors['LINE']!),
              ),
              TextSpan(
                text: '쿠',
                style: textStyle(colors['COUPANG']!),
              ),
              TextSpan(
                text: '배',
                style: textStyle(colors['Woowa Brothers']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
