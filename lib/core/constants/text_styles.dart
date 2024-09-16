import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  TextStyle onBoardingTitle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle onBoardingBody = const TextStyle(
    color: AppColor.grey,
    height: 2,
    fontSize: 17,
  );

  TextStyle mainTitles =
      const TextStyle(fontSize: 33, fontWeight: FontWeight.bold);

  TextStyle appBarTitles = const TextStyle(fontSize: 20, color: AppColor.grey);

  TextStyle mainBodies = const TextStyle(fontSize: 15, color: AppColor.grey);
}
