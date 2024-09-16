import 'package:ezone/controller/on_boarding_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingCont controller = Get.find();

    return Obx(() => InkWell(
          onTap: () {
            controller.lastPage.isFalse
                ? controller.nextPage()
                : controller.goToHomePage();
          },
          child: Container(
            width: 65.w,
            height: 6.5.h,
            decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: controller.lastPage.isTrue
                    ? Text(
                        "13".tr,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Text(
                        "11".tr,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
          ),
        ));
  }
}
