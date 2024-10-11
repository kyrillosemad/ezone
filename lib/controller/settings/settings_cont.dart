import 'package:ezone/controller/homepage/home_page_cont.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsCont extends GetxController {
  Services services = Get.put(Services());
  logout() {
    services.sharedPref!.clear();
    Get.delete<HomePageCont>();
    Get.offAllNamed(AppRoutes().login);
  }

  contactUs() {
    launchUrl(Uri.parse("tel:01147910957"));
  }
}
