import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/data/remote/orders/orders_details_req.dart';
import 'package:get/get.dart';

class OrderDetailsCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  RxList details = [].obs;
  String orderId = Get.arguments['orderId'];
  String orderTotalPrice = Get.arguments['orderTotalPrice'];
    String orderShippingPrice = Get.arguments['orderShippingPrice'];
  String? orderAddressName = Get.arguments['orderAddressName'];
  String? orderAddressCity = Get.arguments['orderAddressCity'];
  String? orderAddressStreet = Get.arguments['orderAddressStreet'];
  getOrderDetails() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response =
        await orderDetailsReq(AppLink.ordersDetails, {
      "id": orderId.toString(),
    });
    response.fold((l) => reqStatus.value = l, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        details.assignAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        details.clear();
      }
    });
    update();
  }
}
