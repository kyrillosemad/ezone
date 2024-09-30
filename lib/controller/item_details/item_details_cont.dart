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

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yellow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];
}
