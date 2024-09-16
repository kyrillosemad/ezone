import 'package:ezone/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCont extends GetxController {
  RxBool obscure = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  login() {
    if (formKey.currentState!.validate()) {
      print("Valid");
    } else {
      print("Not vailid");
    } 
  }

  goToSignUp() {
    Get.offAllNamed(AppRoutes().signUp);
    Get.delete<LoginCont>();
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes().forgetPassword);
  }
}
