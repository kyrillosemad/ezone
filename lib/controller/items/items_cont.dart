import 'package:dartz/dartz.dart';
import 'package:ezone/controller/item_details/item_details_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/favorite/add_favorite_req.dart';
import 'package:ezone/data/remote/favorite/remove_from_favorite_req.dart';
import 'package:ezone/data/remote/items/items_req.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:get/get.dart';

class ItemsCont extends GetxController {
  final Services services = Get.put(Services());
  RxList items = [].obs;
  Rx<Status> reqStatus = Status.initial.obs;

  int selectedCat = Get.arguments['selectedCat'];
  List categories = Get.arguments['categories'];

  changeCat(currentCat) {
    selectedCat = currentCat;
    update();
  }

  getItemsData(id) async {
    reqStatus.value = Status.loading;
    items.clear();

    Either<Status, Map> response = await itemsReq(AppLink.items, {
      "id": id.toString(),
      "usersid": services.sharedPref!.getString("userId"),
    });

    response.fold((l) {
      reqStatus.value = l;
      items.clear();
    }, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        items.addAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        items.clear();
      }
    });
  }

  Future<void> toggleFavorite(itemsId, index) async {
    if (items[index]['favorite'] == 0) {
      await addFavoriteReq(AppLink.favoriteAdd, {
        "usersid": services.sharedPref!.getString("userId").toString(),
        "itemsid": itemsId.toString(),
      });
      items[index]['favorite'] = 1;
    } else {
      await removeFromFavoriteReq(AppLink.favoriteRemove, {
        "usersid": services.sharedPref!.getString("userId").toString(),
        "itemsid": itemsId.toString(),
      });
      items[index]['favorite'] = 0;
    }
    items.refresh();
  }

  goToItemDetails(ItemsModel itemsModel) {
    Get.delete<ItemDetailsCont>();
    Get.toNamed(AppRoutes().itemDetails, arguments: {"itemsModel": itemsModel});
  }
}
