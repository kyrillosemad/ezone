// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LangButton extends StatelessWidget {
  var fun;
  String lang;
  LangButton({super.key, required this.fun, required this.lang});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        width: 50.w,
        height: 6.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: lang == "AR" || lang == "عربي"
                ? AppColor.primaryColor
                : AppColor.fourthColor),
        child: Center(
            child: Text(
          lang,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
