import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p24_ios_plugin/p24_ios_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('p24_ios_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await P24IosPlugin.platformVersion, '42');
  });
}
