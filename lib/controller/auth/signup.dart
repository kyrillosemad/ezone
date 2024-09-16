// ignore_for_file: use_build_context_synchronously
import 'package:dartz/dartz.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/data/remote/auth/signup_req.dart';
import 'package:ezone/view/shared_widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpCont extends GetxController {
  Map data = {};
  Rx<Status> reqStatus = Status.initial.obs;

  RxBool obscure = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  goToCheckEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await signUpAndSendEmail();
      if (reqStatus.value == Status.success) {
        if (data['status'] == "success") {
          Get.toNamed(AppRoutes().emailVerifyCode, arguments: {
            "email": email.text,
          });
        } else {
          errorDialog(data['message'], context);
        }
      } else {
        errorDialog(
            "There's A Problem In Server \n Or In Your Internet Connection",
            context);
      }
    }
  }

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
    Get.delete<SignUpCont>();
  }

  signUpAndSendEmail() async {
    reqStatus.value = Status.loading;

    Either<Status, Map> response = await signUpReq(AppLink.signUp, {
      "username": userName.text,
      "password": password.text,
      "email": email.text,
      "phone": phone.text,
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
