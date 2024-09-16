import 'package:ezone/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ResetPasswordCont extends GetxController {
  RxBool obscureForFirst = true.obs;
  RxBool obscureForSecond = true.obs;
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  resetPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      return AwesomeDialog(
        animType: AnimType.scale,
        dialogType: DialogType.success,
        title: 'Done',
        desc: 'The password Has Been Changed',
        btnOkOnPress: () {
          goToLogin();
        },
        context: context,
      )..show();
    } 
  }

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
    Get.delete<ResetPasswordCont>();
  }
}
