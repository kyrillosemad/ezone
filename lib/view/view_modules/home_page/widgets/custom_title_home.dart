import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontSize: 20,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold));
  }
}
