import 'package:dartz/dartz.dart';
import 'package:ezone/controller/items/items_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/homepage.dart/homepage_data_req.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:get/get.dart';

import '../item_details/item_details_cont.dart';

class HomePageCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  List categories = [];
  List items = [];

  bool isSearch = false;

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
    update();
  }

  goToItemsPage(int selectedCat, List categories) {
    Get.delete<ItemsCont>();
    Get.toNamed(AppRoutes().items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
    });
  }

  goToItemDetails(ItemsModel itemsModel) {
    Get.delete<ItemDetailsCont>();
    Get.toNamed(AppRoutes().itemDetails, arguments: {"itemsModel": itemsModel});
  }
}
