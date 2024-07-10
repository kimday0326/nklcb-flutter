# NKLCB Flutter

NKLCB Flutter는 테크 블로그 크롤링 서비스인 "네카라쿠배"의 모바일 애플리케이션입니다.

## Stack

- Dart
- Flutter

for more information, see [pubspec.yaml](pubspec.yaml)

## Project Structure

- `lib/`: 주요 소스 코드 디렉토리
  - `constants/`: 상수
  - `models/`: 데이터 모델
  - `pages/`: 애플리케이션 페이지
  - `utils/`: 유틸리티 함수
  - `views/`: 재사용 가능한 UI 위젯
- `assets/`: 이미지, 폰트 등 리소스 파일

## Getting Started

1. Clone the repo
   ```sh
   git clone https://github.com/kimday0326/nklcb-flutter.git
   ```
2. Move to the project directory
   ```sh
   cd nklcb-flutter
   ```
3. Install dependencies
   ```sh
   flutter pub get
   ```
4. For using [url_launcher](https://pub.dev/packages/url_launcher) library, add the following code
   - Android: `android/app/src/main/AndroidManifest.xml`
   ```xml
   <queries>
   <intent>
    <action android:name="android.support.customtabs.action.CustomTabsService" />
   </intent>
   </queries>
   ```
   - iOS: `ios/Runner/Info.plist`
   ```xml
   <key>LSApplicationQueriesSchemes</key>
   <array>
   <string>https</string>
   </array>
   ```
5. Run the project
   ```sh
   flutter run
   ```

## LICENSE

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
