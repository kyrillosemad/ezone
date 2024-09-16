import 'package:ezone/controller/on_boarding_cont.dart';
import 'package:ezone/core/constants/text_styles.dart';
import 'package:ezone/data/static/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingCont controller = Get.find();

    return PageView.builder(
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      onPageChanged: controller.onPageChanged,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text("${onBoardingList[index].title}",
                style: AppTextStyles().onBoardingTitle),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              "${onBoardingList[index].image}",
            ),
            const SizedBox(
              height: 30,
            ),
            Text("${onBoardingList[index].body}",
                textAlign: TextAlign.center,
                style: AppTextStyles().onBoardingBody),
          ],
        );
      },
    );
  }
}
