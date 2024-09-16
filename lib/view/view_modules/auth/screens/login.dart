// ignore_for_file: must_be_immutable
import 'package:ezone/controller/auth/login.dart';
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

class Login extends StatelessWidget {
  Login({super.key});
  LoginCont controller = Get.put(LoginCont());
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
              const SizedBox(height: 15),
              const LogoAuth(),
              const CustomTextTitleAuth(
                text: "Welcome Back",
              ),
              const CustomTextBodyAuth(
                  text: "Sign In \n With Your Email And Password "),
              const SizedBox(height: 30),
              CustomTextFormAuth(
                obscure: false,
                myController: controller.email,
                hintText: "Enter Your Email",
                iconData: Icons.email_outlined,
                labelText: "Email",
                valid: (string) {
                  return validator(string, 30, 10, "email");
                },
                isNumber: false,
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
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: const Text(
                  "Forget Password ?",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: AppColor.primaryColor),
                ),
              ),
              const SizedBox(height: 10),
              CustomButtonAuth(
                  text: "Sign In",
                  onPressed: () {
                    controller.login();
                  }),
              const SizedBox(height: 40),
              CustomTextSignUpOrSignIn(
                textOne: "Don't have an account ? ",
                textTwo: "SignUp",
                onTap: () {
                  controller.goToSignUp();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
