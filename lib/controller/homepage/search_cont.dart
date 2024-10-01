import 'package:dartz/dartz.dart';
import 'package:ezone/controller/item_details/item_details_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/homepage.dart/search_req.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  List data = [];
  TextEditingController? searchText;
  RxBool isSearch = false.obs;
  search(String search) async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await searchReq(AppLink.searchItems, {
      "search": search,
    });
    response.fold((l) {
      reqStatus.value = l;
      data = [];
    }, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        data = r['data'];
      } else {
        reqStatus.value = Status.empty;
      }
    });
  }

  goToItemDetails(ItemsModel itemsModel) {
    Get.delete<ItemDetailsCont>();
    Get.toNamed(AppRoutes().itemDetails, arguments: {"itemsModel": itemsModel});
  }
}
