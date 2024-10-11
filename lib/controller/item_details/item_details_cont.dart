import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:get/get.dart';

class ItemDetailsCont extends GetxController {
  ItemsModel itemsModel = Get.arguments['itemsModel'];

  goToCart() {
    Get.delete<CartCont>();
    Get.toNamed(AppRoutes().cart);
  }
}
