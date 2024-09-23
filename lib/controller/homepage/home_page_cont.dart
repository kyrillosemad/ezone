import 'package:ezone/core/services/services.dart';
import 'package:get/get.dart';

class HomePageCont extends GetxController {
  Services services = Get.find<Services>();
  var userId = Get.find<Services>().sharedPref!.getString("userId");
  var userEmail = Get.find<Services>().sharedPref!.getString("userEmail");
  var userName = Get.find<Services>().sharedPref!.getString("userName");
  var userPhone = Get.find<Services>().sharedPref!.getString("userPhone");

  getHomePageData() {}
}
