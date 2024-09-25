import 'package:ezone/controller/on_boarding/on_boarding_cont.dart';
import 'package:ezone/view/view_modules/on_boarding/widgets/custom_button.dart';
import 'package:ezone/view/view_modules/on_boarding/widgets/page_indicator.dart';
import 'package:ezone/view/view_modules/on_boarding/widgets/page_view.dart';
import 'package:ezone/view/view_modules/on_boarding/widgets/skip_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingCont controller = Get.put(OnBoardingCont());
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          alignment: const Alignment(0.75, 0.95),
          children: [
            ///////////////////////////////////////////////////////////////////////
            const CustomPageView(),
            ///////////////////////////////////////////////////////////////////////
            SizedBox(
              width: 100.w,
              height: 25.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  ///////////////////////////////////////////////////////////////////////
                  PageIndicator(onBoardingCont: controller.pageController),
                  SizedBox(
                    height: 3.h,
                  ),
                  ///////////////////////////////////////////////////////////////////////
                  const CustomButton(),
                  SizedBox(
                    height: 1.h,
                  ),
                  ///////////////////////////////////////////////////////////////////////
                  SkipText(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
