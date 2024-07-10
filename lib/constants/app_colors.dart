import 'dart:ui';

class AppColors {
  static const Color primaryColor = Color(0xFFEEEEEE);
  static const Color naverGreen = Color(0xFF2DB400);
  static const Color kakaoYellow = Color(0xFFFFCD00);
  static const Color lineGreen = Color(0xFF2BE567);
  static const Color coupangRed = Color(0xFFF23C24);
  static const Color woowaTurquoise = Color(0xFF48D1CC);
  static const Color tossBlue = Color(0xFF0064FF);
  static const Color daangnOrange = Color(0xFFFD5810);
  static const Color defaultColor = Color(0xFF202632);

  static const Map<String, Color> companyColors = {
    'naver': naverGreen,
    'kakao': kakaoYellow,
    'line': lineGreen,
    'coupang': coupangRed,
    'woowa': woowaTurquoise,
    'toss': tossBlue,
    '당근': daangnOrange,
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
