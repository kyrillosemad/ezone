// ignore_for_file: use_build_context_synchronously
import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/reset_password/check_email_for_password_reset_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordCont extends GetxController {
  Map data = {};
  Rx<Status> reqStatus = Status.initial.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  goToPassVerifyCode(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await sendCode();
      if (reqStatus.value == Status.success) {
        if (data['status'] == "success") {
          Get.toNamed(AppRoutes().passVerifyCode, arguments: {
            "email": email.text,
          });
          Get.delete<ForgetPasswordCont>();
        } else {
          errorDialog("Not correct Email", context);
        }
      } else {
        errorDialog(
            "There's A Problem In Server \n Or In Your Internet Connection",
            context);
      }
    }
  }

  sendCode() async {
    reqStatus.value = Status.loading;

    Either<Status, Map> response =
        await checkEmailForPasswordResetReq(AppLink.checkEmail, {
      "email": email.text,
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
