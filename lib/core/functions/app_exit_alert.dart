import 'dart:io';

import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> appExitAlert() {
  Get.defaultDialog(
    title: "Alert !",
    middleText: "Are You Sure To Exit App",
    cancelTextColor: AppColor.primaryColor,
    confirmTextColor: Colors.white,
    buttonColor: AppColor.primaryColor,
    onCancel: () {},
    onConfirm: () {
      exit(0);
    },
  );
  return Future.value(true);
}
