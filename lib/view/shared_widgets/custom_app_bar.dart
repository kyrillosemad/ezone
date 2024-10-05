import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.primaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 22, color: AppColor.primaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
