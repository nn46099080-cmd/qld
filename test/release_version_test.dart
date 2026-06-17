import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('release version codes stay in sync', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final androidBuild =
        File('android/app/build.gradle.kts').readAsStringSync();
    final appMain = File('lib/main.dart').readAsStringSync();
    final worker = File('cloudflare-worker/src/index.js').readAsStringSync();

    final pubspecCode = _firstInt(
      pubspec,
      RegExp(r'^version:\s+\d+\.\d+\.\d+\+(\d+)', multiLine: true),
    );
    final androidCode = _firstInt(
      androidBuild,
      RegExp(r'versionCode\s*=\s*(\d+)'),
    );
    final appCode = _firstInt(
      appMain,
      RegExp(r'const _currentAppVersionCode\s*=\s*(\d+);'),
    );
    final workerCode = _firstInt(
      worker,
      RegExp(r'latestVersionCode:\s*(\d+)'),
    );

    expect(androidCode, pubspecCode);
    expect(appCode, pubspecCode);
    expect(workerCode, pubspecCode);
  });
}

int _firstInt(String source, RegExp pattern) {
  final match = pattern.firstMatch(source);
  expect(match, isNotNull, reason: 'Missing pattern: ${pattern.pattern}');
  return int.parse(match!.group(1)!);
}
