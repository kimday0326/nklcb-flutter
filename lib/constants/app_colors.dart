import 'dart:ui';

class AppColors {
  static const Color naverGreen = Color(0xFF2DB400);
  static const Color kakaoYellow = Color(0xFFFFCD00);
  static const Color lineGreen = Color(0xFF06C755);
  static const Color coupangRed = Color(0xFFF23C24);
  static const Color woowaTurquoise = Color(0xFF48D1CC);
  static const Color defaultColor = Color.fromARGB(255, 74, 74, 74);

  static const Map<String, Color> _companyColors = {
    'naver': naverGreen,
    'kakao': kakaoYellow,
    'line': lineGreen,
    'coupang': coupangRed,
    'woowa': woowaTurquoise,
  };

  static Color getCompanyColor(String companyName) {
    companyName = companyName.toLowerCase();
    print(companyName);
    for (String key in _companyColors.keys) {
      if (companyName.contains(key)) {
        return _companyColors[key]!;
      }
    }
    return defaultColor;
  }
}
