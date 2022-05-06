import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> kh = {
    "hello": 'សួស្ដី',
    "name": "ខ្ញុំបាទឈ្មោះអាញុយ",
    "appBar": "បកប្រែភាសា"
  };
  static const Map<String, dynamic> en = {
    "hello": 'Hello',
    "name": "I'm Nhuii",
    "appBar": "Translation"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "km": kh,
    "en": en
  };
}
