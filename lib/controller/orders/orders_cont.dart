import 'package:dartz/dartz.dart';
import 'package:ezone/controller/orders/orders_detatils.cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/orders/orders_req.dart';
import 'package:get/get.dart';

class OrdersCont extends GetxController {
  Services services = Get.put(Services());
  RxList orders = [].obs;
  Rx<Status> reqStatus = Status.initial.obs;

  getPendingOrders() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await ordersReq(AppLink.pendingOrders, {
      "id": services.sharedPref!.getString("userId"),
    });
    response.fold((l) => reqStatus.value = l, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        orders.assignAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        orders.clear();
      }
    });
    update();
  }

  getArchiveOrders() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await ordersReq(AppLink.ordersArchive, {
      "id": services.sharedPref!.getString("userId"),
    });
    response.fold((l) => reqStatus.value = l, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        orders.assignAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        orders.clear();
      }
    });
    update();
  }

  orderType(orderType) {
    if (orderType == "0") {
      return "Delivery";
    } else {
      return "DriveThru";
    }
  }

  paymentMethod(paymentMethod) {
    if (paymentMethod == "0") {
      return "Cash";
    } else {
      return "With Card";
    }
  }

  ordersStatus(orderType) {
    if (orderType == 1) {
      return "Await Approval";
    } else if (orderType == 2) {
      return "Preparing";
    } else if (orderType == 3) {
      return "On The Way";
    } else {
      return "Completed";
    }
  }

  goToOrderDetails(orderId, orderTotalPrice, orderAddressName, orderAddressCity,
      orderAddressStreet, orderShippingPrice) {
    Get.delete<OrderDetailsCont>();
    Get.toNamed(AppRoutes().orderDetails, arguments: {
      "orderId": orderId.toString(),
      "orderTotalPrice": orderTotalPrice.toString(),
      "orderAddressName": orderAddressName.toString(),
      "orderAddressCity": orderAddressCity.toString(),
      "orderAddressStreet": orderAddressStreet.toString(),
      "orderShippingPrice": orderShippingPrice.toString(),
    });
  }

  deleteOrder(String orderId, int index) async {
    Either<Status, Map> response =
        await ordersReq(AppLink.ordersDelete, {"id": orderId});

    response.fold((l) {
      Get.snackbar("Error", "Failed to remove from Orders");
    }, (r) {
      if (r['status'] == "success") {
        orders.removeAt(index);
        Get.snackbar("Success", "The Order Is Canceled Successfully",
            duration: const Duration(milliseconds: 1000));
      }
    });
    update();
  }
}
