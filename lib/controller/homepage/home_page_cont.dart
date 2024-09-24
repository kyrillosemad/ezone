import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/homepage.dart/homepage_data_req.dart';
import 'package:get/get.dart';

class HomePageCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  List categories = [];
  List items = [];

  Services services = Get.find<Services>();
  var userId = Get.find<Services>().sharedPref!.getString("userId");
  var userEmail = Get.find<Services>().sharedPref!.getString("userEmail");
  var userName = Get.find<Services>().sharedPref!.getString("userName");
  var userPhone = Get.find<Services>().sharedPref!.getString("userPhone");

  getHomePageData() async {
    reqStatus.value = Status.loading;
    categories = [];
    items = [];

    Either<Status, Map> response = await homePageDataReq(AppLink.homepage, {});

    response.fold((l) {
      reqStatus.value = l;
      items = [];
      categories = [];
    }, (r) {
      reqStatus.value = Status.success;
      items.addAll(r['items']['data']);
      categories.addAll(r['categories']['data']);
    });
  }
}
