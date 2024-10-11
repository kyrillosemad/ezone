// ignore_for_file: use_build_context_synchronously
import 'package:dartz/dartz.dart';
import 'package:ezone/controller/auth/signup.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/auth/email_verify_code_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyCodeCont extends GetxController {
  Rx<Status> reqStatus = Status.initial.obs;
  Map data = {};

  String email = Get.arguments['email'];

  checkCode(BuildContext context, String verifyCode) async {
    await completeSignUp(verifyCode);
    if (reqStatus.value == Status.success) {
      if (data['status'] == "success") {
        Get.offAllNamed(AppRoutes().login);
        Get.delete<SignUpCont>();
        Get.delete<EmailVerifyCodeCont>();
      } else {
        errorDialog("Wrong Verify Code", context);
      }
    } else {
      errorDialog(
          "There's A Problem In Server \n Or In Your Internet Connection",
          context);
    }
  }

  completeSignUp(String verifyCode) async {
    reqStatus.value = Status.loading;
    Either<Status, Map> response =
        await emailVerifyCodeReq(AppLink.verifyCodeSignup, {
      "email": email,
      "verifycode": verifyCode,
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
