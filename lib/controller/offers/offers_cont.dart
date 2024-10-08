import 'package:dartz/dartz.dart';
import 'package:ezone/controller/item_details/item_details_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/offers/offers_req.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:get/get.dart';

class OffersCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  RxList offersData = [].obs;

  getOffersData() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await offersReq(AppLink.offers, {});

    response.fold((l) => reqStatus.value = l, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        offersData.assignAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        offersData.clear();
      }
    });
  }
    goToItemDetails(ItemsModel itemsModel) {
    Get.delete<ItemDetailsCont>();
    Get.toNamed(AppRoutes().itemDetails, arguments: {"itemsModel": itemsModel});
  }
}
