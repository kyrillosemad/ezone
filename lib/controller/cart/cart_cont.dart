// ignore_for_file: use_build_context_synchronously
import 'package:dartz/dartz.dart';
import 'package:ezone/controller/checkout/checkout_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/cart/add_to_cart_req.dart';
import 'package:ezone/data/remote/cart/chech_coupon_req.dart';
import 'package:ezone/data/remote/cart/delete_from_cart_req.dart';
import 'package:ezone/data/remote/cart/get_cart_count.dart';
import 'package:ezone/data/remote/cart/view_all_cart_data_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCont extends GetxController {
  Services services = Get.put(Services());
  Rx<Status> reqStatus = Status.initial.obs;
  TextEditingController couponNameCont = TextEditingController();
  RxInt totalItemCount = 0.obs;

  RxInt discount = 0.obs;

  RxMap totalCartData = {}.obs;
  RxList cartItemsData = [].obs;

  String? couponId;

  addToCart(itemId, BuildContext context) async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await addToCartReq(AppLink.cartAdd, {
      "usersid": services.sharedPref!.getString("userId"),
      "itemsid": itemId.toString(),
    });

    response.fold((l) {
      errorDialog("There's Something Wrong , Please Try Again $l ", context);
    }, (r) {
      totalItemCount.value = totalItemCount.value + 1;
      viewCartData();
    });
  }

  deleteFromCart(itemId, BuildContext context) async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await deleteFromCartReq(AppLink.cartDelete, {
      "usersid": services.sharedPref!.getString("userId"),
      "itemsid": itemId.toString(),
    });

    response.fold((l) {
      errorDialog("There's Something Wrong , Please Try Again $l ", context);
    }, (r) {
      totalItemCount.value = totalItemCount.value - 1;
      viewCartData();
    });
  }

  getTotalItemCount(itemId) async {
    reqStatus.value = Status.loading;

    Either<Status, Map> response =
        await getCartCountReq(AppLink.cartGetCountItems, {
      "usersid": services.sharedPref!.getString("userId"),
      "itemsid": itemId.toString(),
    });

    response.fold((l) {
      reqStatus.value = l;
      totalItemCount.value = 0;
    }, (r) {
      reqStatus.value = Status.success;
      totalItemCount.value = r['data'];
    });
    update();
  }

  viewCartData() async {
    reqStatus.value = Status.loading;
    totalCartData.clear();
    cartItemsData.clear();

    Either<Status, Map> response = await viewAllCartDataReq(AppLink.cartView, {
      "usersid": services.sharedPref!.getString("userId"),
    });

    response.fold((l) {
      reqStatus.value = l;
      totalCartData.clear();
      cartItemsData.clear();
    }, (r) {
      if (r['datacart']['status'] == "success") {
        reqStatus.value = Status.success;
        totalCartData.value = r["countprice"];
        cartItemsData.addAll(r['datacart']['data']);
      } else {
        reqStatus.value = Status.empty;
      }
    });
  }

  checkCoupon(couponName, BuildContext context) async {
    Either<Status, Map> response = await checkCouponReq(AppLink.checkCoupon, {
      "couponname": couponName,
    });
    response.fold((l) {
      errorDialog("NoT Valid Coupon", context);
    }, (r) {
      if (r['status'] == 'success') {
        couponId = r['data']['coupon_id'].toString();
        discount.value = r['data']['coupon_discount'];
      } else {
        couponId = null;
        errorDialog("NoT Valid Coupon", context);
      }
    });
    couponNameCont.clear();
  }

  goToPlaceOrder(BuildContext context, String couponDiscount) {
    if (cartItemsData.isEmpty) {
      errorDialog("The Cart Is Empty", context);
    } else {
      Get.delete<CheckoutCont>();
      Get.toNamed(AppRoutes().checkout, arguments: {
        "couponId": couponId ?? "0",
        "orderPrice": totalCartData['totalprice'].toString(),
        "shipping": "300",
        "couponDiscount": couponDiscount.toString()
      });
    }
  }

}
