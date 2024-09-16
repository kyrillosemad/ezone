// ignore_for_file: must_be_immutable
import 'package:ezone/controller/auth/pas_verify_code.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/text_styles.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../widgets/customtexttitleauth.dart';

class PasVerifyCode extends StatelessWidget {
  PasVerifyCode({super.key});
  PasVerifyCodeCont controller = PasVerifyCodeCont();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.grey,
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Verification Code',
          style: AppTextStyles().appBarTitles,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check Code"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
                  "Enter The Verification Code Sent To \n kyrillos243648@gmail.com"),
          const SizedBox(height: 25),
          OtpTextField(
            fieldWidth: 50,
            enabledBorderColor: AppColor.black,
            focusedBorderColor: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              controller.goToResetPassword();
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
