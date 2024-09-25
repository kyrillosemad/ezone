import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/items/items_req.dart';
import 'package:get/get.dart';

class ItemsCont extends GetxController {
  List items = [];
  Rx<Status> reqStatus = Status.initial.obs;

  int selectedCat = Get.arguments['selectedCat'];
  List categories = Get.arguments['categories'];

  changeCat(currentCat) {
    selectedCat = currentCat;
    update();
  }

  getItemsData(id) async {
    reqStatus.value = Status.loading;
    items = [];

    Either<Status, Map> response =
        await itemsReq(AppLink.items, {"id": id.toString()});

    response.fold((l) {
      reqStatus.value = l;
      items = [];
    }, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        items.addAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        items = [];
      }
    });
    update();
  }

  goToItemDetails() {
    Get.toNamed(AppRoutes().itemDetails);
  }
}
