// ignore_for_file: must_be_immutable
import 'package:ezone/controller/auth/forget_password.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/text_styles.dart';
import 'package:ezone/core/functions/validator.dart';
import 'package:ezone/view/view_modules/auth/widgets/custombuttonauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextbodyauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextformauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  ForgetPasswordCont controller = Get.put(ForgetPasswordCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.grey,
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Forget Password',
          style: AppTextStyles().appBarTitles,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formKey,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Check Email"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text: "Enter Your Email Now \n To Receive A Verification Code"),
            const SizedBox(height: 25),
            CustomTextFormAuth(
              myController: controller.email,
              hintText: "Enter Your Email",
              iconData: Icons.email_outlined,
              labelText: "Email",
              valid: (string) {
                return validator(string, 30, 10, "email");
              },
              obscure: false,
              isNumber: false,
            ),
            CustomButtonAuth(
                text: "Check",
                onPressed: () {
                  controller.goToPassVerifyCode();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
