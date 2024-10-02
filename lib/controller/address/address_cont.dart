import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/address/add_address_req.dart';
import 'package:ezone/data/remote/address/delete_address_req.dart';
import 'package:ezone/data/remote/address/view_all_addresses_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCont extends GetxController {
  Services services = Get.put(Services());
  Rx<Status> reqStatus = Status.initial.obs;
  RxList addresses = [].obs;
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();

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

  goToAddNewAddress() {
    Get.delete<AddressCont>();
    Get.toNamed(AppRoutes().addNewAddress);
  }

  addNewAddress(BuildContext context) async {
    reqStatus.value = Status.initial;
    Either<Status, Map> response = await addAddressReq(AppLink.addressAdd, {
      "usersid": services.sharedPref!.getString("userId"),
      "name": name.text,
      "city": city.text,
      "street": street.text,
      "lat": "",
      "long": "",
    });
    response.fold((l) {
      errorDialog("There's Some Thing Wrong", context);
    }, (r) {
      if (r['status'] == "success") {
        reqStatus.value = Status.success;
        Get.offAllNamed(AppRoutes().bottomAppBar);
        Get.snackbar("Success", "New Address Is Added",
            duration: const Duration(milliseconds: 1000));
      } else {
        errorDialog("There's Some Thing Wrong", context);
      }
    });
  }

  deleteAddress(BuildContext context, addressId, index) async {
    Either<Status, Map> response = await deleteAddressReq(
        AppLink.addressDelete, {"addressid": addressId.toString()});

    response.fold((l) {
      errorDialog("Failed to remove from Addresses", context);
    }, (r) {
      if (r['status'] == "success") {
        addresses.removeAt(index);
        Get.snackbar("Success", "Removed from favorites",
            duration: const Duration(milliseconds: 600));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    name.clear();
    city.clear();
    street.clear();
  }
}
