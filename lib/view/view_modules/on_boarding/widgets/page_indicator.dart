import 'package:ezone/controller/on_boarding/on_boarding_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/data/static/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class PageIndicator extends StatelessWidget {
  PageIndicator({super.key, required PageController onBoardingCont});
  final OnBoardingCont controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller.pageController,
        count: onBoardingList.length,
        effect: const ScrollingDotsEffect(
            activeDotColor: AppColor.secondColor,
            activeStrokeWidth: 2.6,
            activeDotScale: 1.4,
            maxVisibleDots: 5,
            radius: 8,
            spacing: 10,
            dotHeight: 12,
            dotWidth: 12,
            dotColor: AppColor.grey));
  }
}
