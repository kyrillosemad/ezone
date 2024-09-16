import 'package:ezone/controller/on_boarding_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipText extends StatelessWidget {
  SkipText({super.key});
  final OnBoardingCont controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToHomePage();
      },
      child: Text(
        "12".tr,
        style: const TextStyle(fontSize: 20, color: AppColor.black),
      ),
    );
  }
}
