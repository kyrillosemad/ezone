import 'package:dartz/dartz.dart';
import 'package:ezone/controller/item_details/item_details_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/favorite/remove_from_favorite_req.dart';
import 'package:ezone/data/remote/favorite/view_favorite_req.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:get/get.dart';

class FavoriteCont extends GetxController {
  RxList favorite = <dynamic>[].obs;
  Rx<Status> reqStatus = Status.initial.obs;

  Services services = Get.put(Services());

  getAllFavorite() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await viewFavoriteReq(AppLink.favoriteView, {
      "id": services.sharedPref!.getString("userId"),
    });

    response.fold((l) => reqStatus.value = l, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        favorite.assignAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        favorite.clear();
      }
    });
  }

  deleteFromFavorite(String favoriteId, int index) async {
    Either<Status, Map> response = await removeFromFavoriteReq(
        AppLink.deleteFromFavorite, {"id": favoriteId});

    response.fold((l) {
      Get.snackbar("Error", "Failed to remove from favorites");
    }, (r) {
      if (r['status'] == "success") {
        favorite.removeAt(index);
        Get.snackbar("Success", "Removed from favorites",
            duration: const Duration(milliseconds: 1000));
      }
    });
  }

  goToItemDetails(ItemsModel itemsModel) {
    Get.delete<ItemDetailsCont>();
    Get.toNamed(AppRoutes().itemDetails, arguments: {"itemsModel": itemsModel});
  }
}
