// ignore_for_file: must_be_immutable
import 'package:ezone/controller/auth/signup.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/functions/app_exit_alert.dart';
import 'package:ezone/core/functions/validator.dart';
import 'package:ezone/view/view_modules/auth/widgets/custombuttonauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextbodyauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextformauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtexttitleauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/logoauth.dart';
import 'package:ezone/view/view_modules/auth/widgets/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  SignUpCont controller = Get.put(SignUpCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formKey,
            child: ListView(children: [
              const SizedBox(height: 5),
              const LogoAuth(),
              const CustomTextTitleAuth(text: "Welcome Back"),
              const CustomTextBodyAuth(
                  text: "Sign Up \n With Your Email And Password"),
              const SizedBox(height: 20),
              CustomTextFormAuth(
                myController: controller.userName,
                hintText: "Enter Your Username",
                iconData: Icons.person_outline,
                labelText: "Username",
                valid: (string) {
                  return validator(string, 30, 3, "username");
                },
                obscure: false,
                isNumber: false,
              ),
              CustomTextFormAuth(
                valid: (string) {
                  return validator(string, 30, 10, "email");
                },
                obscure: false,
                isNumber: false,
                myController: controller.email,
                hintText: "Enter Your Email",
                iconData: Icons.email_outlined,
                labelText: "Email",
              ),
              CustomTextFormAuth(
                valid: (string) {
                  return validator(string, 30, 11, "phone");
                },
                obscure: false,
                isNumber: true,
                myController: controller.phone,
                hintText: "Enter Your Phone",
                iconData: Icons.phone_android_outlined,
                labelText: "Phone",
              ),
              Obx(() => CustomTextFormAuth(
                    obscure: controller.obscure.value,
                    myController: controller.password,
                    hintText: "Enter Your Password",
                    iconData: controller.obscure.value == true
                        ? Icons.lock_outline
                        : Icons.lock_open,
                    labelText: "Password",
                    valid: (string) {
                      return validator(string, 30, 4, "password");
                    },
                    onTapIcon: () {
                      controller.obscure.value = !controller.obscure.value;
                    },
                    isNumber: false,
                  )),
              Obx(() {
                if (controller.reqStatus.value == Status.loading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: AppColor.primaryColor,
                    color: Colors.white,
                  ));
                } else {
                  return CustomButtonAuth(
                    text: "Sign Up",
                    onPressed: () {
                      controller.goToCheckEmail(context);
                    },
                  );
                }
              }),
              const SizedBox(height: 15),
              CustomTextSignUpOrSignIn(
                textOne: " have an account ? ",
                textTwo: " SignIn ",
                onTap: () {
                  controller.goToLogin();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
