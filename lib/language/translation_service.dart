import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'vietnamese.dart';
import 'english.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('vn', 'VN');
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'vn_VN': vietnamese,
    'en_US': english,
  };
}
