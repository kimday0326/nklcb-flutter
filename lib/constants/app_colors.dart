import 'dart:ui';

class AppColors {
  static const Color primaryColor = Color(0xFFEEEEEE);
  static const Color naverGreen = Color(0xFF2DB400);
  static const Color kakaoYellow = Color(0xFFFFCD00);
  static const Color lineGreen = Color(0xFF2BE567);
  static const Color coupangRed = Color(0xFFF23C24);
  static const Color woowaTurquoise = Color(0xFF48D1CC);
  static const Color defaultColor = Color.fromARGB(255, 74, 74, 74);

  static const Map<String, Color> companyColors = {
    'naver': naverGreen,
    'kakao': kakaoYellow,
    'line': lineGreen,
    'coupang': coupangRed,
    'woowa': woowaTurquoise,
  };

  static Color getCompanyColor(String companyName) {
    companyName = companyName.toLowerCase();
    for (String key in companyColors.keys) {
      if (companyName.contains(key)) {
        return companyColors[key]!;
      }
    }
    return defaultColor;
  }
}
