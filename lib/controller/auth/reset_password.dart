// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/reset_password/reset_password_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  Map data = {};

  String email = Get.arguments['email'];

  RxBool obscureForFirst = true.obs;
  RxBool obscureForSecond = true.obs;
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  resetPassword(BuildContext context) async {
    if (password.text == newPassword.text) {
      await resetPasswordFun();
      if (formKey.currentState!.validate()) {
        if (reqStatus.value == Status.success) {
          if (data["status"] == "success") {
            goToLogin();
          } else {
            errorDialog("There's something Wrong ! Please Try Again", context);
          }
        } else {
          errorDialog(
              "There's A Problem In Server \n Or In Your Internet Connection",
              context);
        }
      }
    } else {
      errorDialog("Not Same Password", context);
    }
  }

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
    Get.delete<ResetPasswordCont>();
  }

  resetPasswordFun() async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response =
        await resetPasswordReq(AppLink.resetPassword, {
      "email": email.toString(),
      "password": newPassword.text,
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
