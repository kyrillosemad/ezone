import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopItemDetailsPage extends StatelessWidget {
  const TopItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "",
              child: Image.asset(AppImages().logo),
            ))
      ],
    );
  }
}
