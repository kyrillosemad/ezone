// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/data/remote/auth/login.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCont extends GetxController {
  Map data = {};
  Rx<Status> reqStatus = Status.initial.obs;
  RxBool obscure = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  login(BuildContext context) async {
    final Services services = Get.put(Services());
    if (formKey.currentState!.validate()) {
      await loginFun();
      if (reqStatus.value == Status.success) {
        if (data["status"] == "success") {
          Get.offAllNamed(AppRoutes().homePage);
          Get.delete<LoginCont>();
          services.sharedPref!
              .setString("userId", data["data"]['user_id'].toString());
          services.sharedPref!
              .setString("userName", data["data"]['users_name'].toString());
          services.sharedPref!
              .setString("userEmail", data["data"]['users_email'].toString());
          services.sharedPref!
              .setString("userPhone", data["data"]['users_phone'].toString());
        } else {
          errorDialog("Wrong Email Or Password !", context);
        }
      } else {
        errorDialog(
            "There's A Problem In Server \n Or In Your Internet Connection",
            context);
      }
    }
  }

  goToSignUp() {
    Get.offAllNamed(AppRoutes().signUp);
    Get.delete<LoginCont>();
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes().forgetPassword);
  }

  loginFun() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response = await loginReq(AppLink.login, {
      "email": email.text,
      "password": password.text,
    });

    response.fold((status) {
      reqStatus.value = status;
      data = {};
    }, (result) {
      reqStatus.value = Status.success;
      data = result;
    });
  }
}
