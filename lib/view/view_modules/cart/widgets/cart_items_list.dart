import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/images.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  const CartItemsList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              AppImages().logo,
              height: 90,
              fit: BoxFit.cover,
            )),
        Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name, style: const TextStyle(fontSize: 15)),
              subtitle: Text(price,
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontSize: 17)),
            )),
        Expanded(
            child: Column(
          children: [
            SizedBox(
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add))),
            SizedBox(
                child: Text(
              count,
              style: const TextStyle(fontFamily: "sans"),
            )),
            SizedBox(
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove)))
          ],
        ))
      ]),
    );
  }
}
