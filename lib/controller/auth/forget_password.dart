import 'package:ezone/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordCont extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  sendCode() {}

  goToPassVerifyCode() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes().passVerifyCode);
      Get.delete<ForgetPasswordCont>();
    } else {
      print("Not Valid");
    }
  }
}
