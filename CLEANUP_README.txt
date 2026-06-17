QLD Alert App 정리본

수정 완료:
- Android Gradle 충돌 정리
- package name 통일
- Java 17 설정 통일
- release signing 구조 정리
- 불필요 캐시 제거
- 중복 프로젝트 폴더 제거

빌드 순서:

1. 프로젝트 폴더 열기
2. upload-keystore.jks 를 프로젝트 루트에 넣기
3. android/key.properties 수정
4. 터미널 실행

flutter clean
flutter pub get
flutter build appbundle --release

성공 시:
build/app/outputs/bundle/release/app-release.aab

생성됩니다.
