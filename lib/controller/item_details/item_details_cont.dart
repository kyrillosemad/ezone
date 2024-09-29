import 'package:ezone/model/items/items_model.dart';
import 'package:get/get.dart';

class ItemDetailsCont extends GetxController {
  ItemsModel itemsModel = Get.arguments['itemsModel'];

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yellow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];
}
