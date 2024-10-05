// ignore_for_file: unnecessary_null_comparison
import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/address/view_all_addresses_req.dart';
import 'package:ezone/data/remote/checkout/checkout_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  Services services = Get.put(Services());
  RxList addresses = [].obs;
  RxString paymentMethod = ''.obs;
  RxString deliveryType = ''.obs;
  RxString shippingAddress = ''.obs;

  String couponId = Get.arguments['couponId'];
  String orderPrice = Get.arguments['orderPrice'];
  String shipping = Get.arguments['shipping'];
  String couponDiscount = Get.arguments['couponDiscount'];

  @override
  void onInit() {
    super.onInit();
    getAllAddresses(); // Call this in onInit, not in build
  }

  choosePaymentMethod(String payment) {
    paymentMethod.value = payment;
  }

  chooseDeliveryMethod(String delivery) {
    deliveryType.value = delivery;
  }

  chooseShippingAddress(String addressId) {
    shippingAddress.value = addressId;
  }

  getAllAddresses() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response =
        await viewAllAddressesReq(AppLink.addressView, {
      "usersid": services.sharedPref!.getString("userId"),
    });

    response.fold((l) => reqStatus.value = l, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        addresses.assignAll(r['data']);
      } else {
        reqStatus.value = Status.empty;
        addresses.clear();
      }
    });
  }

  checkout(BuildContext context) async {
    if (paymentMethod.value == '' || deliveryType.value == '') {
      errorDialog("Please Select The Required Information ", context);
    } else {
      if (deliveryType.value == "0" && shippingAddress.value == '') {
        errorDialog("Please Select The Address", context);
      } else {
        Either<Status, Map> response = await checkoutReq(AppLink.checkout, {
          "usersid": services.sharedPref!.getString("userId").toString(),
          "addressid": shippingAddress.toString(),
          "orderstype": deliveryType.toString(),
          "pricedelivery": shipping.toString(),
          "ordersprice": orderPrice.toString(),
          "couponid": couponId.toString(),
          "paymentmethod": paymentMethod.toString(),
          "coupondiscount": couponDiscount.toString(),
        });
        response.fold((l) {
          errorDialog("There's Something Wrong", context);
        }, (r) {
          Get.snackbar("Done", "The Order Is CheckedOut",
              duration: const Duration(milliseconds: 1200));
          Get.offAllNamed(AppRoutes().bottomAppBar);
        });
      }
    }
  }
}
