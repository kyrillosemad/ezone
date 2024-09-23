// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/reset_password/email_verify_code_for_password_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasVerifyCodeCont extends GetxController {
  String email = Get.arguments['email'];
  Map data = {};
  Rx<Status> reqStatus = Status.initial.obs;

  goToResetPassword(BuildContext context, userVerifyCode) async {
    await checkCode(userVerifyCode);
    if (reqStatus.value == Status.success) {
      if (data['status'] == "success") {
        Get.toNamed(AppRoutes().resetPassword, arguments: {
          "email": email,
        });
        Get.delete<PasVerifyCodeCont>();
      } else {
        errorDialog("Wrong Verify Code", context);
      }
    } else {
      errorDialog(
          "There's A Problem In Server \n Or In Your Internet Connection",
          context);
    }
  }

  checkCode(userVerifyCode) async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response =
        await emailVerifyCodeForPasswordReq(AppLink.verifyCodeForgetPassword, {
      "email": email.toString(),
      "verifycode": userVerifyCode.toString(),
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
