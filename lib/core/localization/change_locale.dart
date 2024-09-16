import 'dart:ui';
import 'package:ezone/core/services/services.dart';
import 'package:get/get.dart';

class LocaleClass extends GetxController {
  final Services services = Get.put(Services());
  String curLang = "EN";
  void changeLocale(String langCode) {
    Get.updateLocale(Locale(langCode));
    update();
  }
}
