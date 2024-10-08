import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsCont extends GetxController {
  Service service = Get.put(Service());
  logout() {
    print("hi");
  }

  contactUs() {
    launchUrl(Uri.parse("tel:01147910957"));
  }
}
