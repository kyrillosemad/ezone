import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardShapingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardShapingAddressCheckout(
      {Key? key,
      required this.title,
      required this.body,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondColor : Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColor.primaryColor)),
      child: ListTile(
        title: Text(title,
            style: TextStyle(
                color: isActive ? Colors.white : null,
                fontWeight: FontWeight.bold)),
        subtitle: Text(body,
            style: TextStyle(
                color: isActive ? Colors.white : null,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
