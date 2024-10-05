import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          color: isActive == true ? AppColor.secondColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Text(title,
          style: TextStyle(
              color: isActive == true ? Colors.white : AppColor.secondColor,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}
