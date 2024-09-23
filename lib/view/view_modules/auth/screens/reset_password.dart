// ignore_for_file: must_be_immutable
import 'package:ezone/controller/auth/reset_password.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/text_styles.dart';
import 'package:ezone/core/functions/validator.dart';
import 'package:ezone/view/view_modules/auth/widgets/custombuttonauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextbodyauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextformauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  ResetPasswordCont controller = Get.put(ResetPasswordCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.grey,
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('ResetPassword', style: AppTextStyles().appBarTitles),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formKey,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "New Password"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(text: "Please Enter new Password"),
            const SizedBox(height: 40),
            Obx(() => CustomTextFormAuth(
                  obscure: controller.obscureForFirst.value,
                  myController: controller.password,
                  hintText: "Enter Your Password",
                  iconData: controller.obscureForFirst.value == true
                      ? Icons.lock_outline
                      : Icons.lock_open,
                  labelText: "Password",
                  valid: (string) {
                    return validator(string, 30, 4, "password");
                  },
                  onTapIcon: () {
                    controller.obscureForFirst.value =
                        !controller.obscureForFirst.value;
                  },
                  isNumber: false,
                )),
            Obx(() => CustomTextFormAuth(
                  obscure: controller.obscureForSecond.value,
                  myController: controller.newPassword,
                  hintText: "Enter Your Password",
                  iconData: controller.obscureForSecond.value == true
                      ? Icons.lock_outline
                      : Icons.lock_open,
                  labelText: "Password",
                  valid: (string) {
                    return validator(string, 30, 4, "password");
                  },
                  onTapIcon: () {
                    controller.obscureForSecond.value =
                        !controller.obscureForSecond.value;
                  },
                  isNumber: false,
                )),
            Obx(() {
              return controller.reqStatus.value == Status.loading
                  ? const Center(
                      child: CircularProgressIndicator(
                      backgroundColor: AppColor.primaryColor,
                      color: Colors.white,
                    ))
                  : CustomButtonAuth(
                      text: "save",
                      onPressed: () async {
                        await controller.resetPassword(context);
                      });
            }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
