import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartBottomPart extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CartBottomPart({Key? key, required this.textButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 75.w,
      child: MaterialButton(
        height: 35,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textButton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
