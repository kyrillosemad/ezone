import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CartBottomPart extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CartBottomPart({Key? key, required this.textButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        height: 40,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textButton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
