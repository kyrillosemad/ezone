import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_bottom_part.dart';
import 'package:flutter/material.dart';

class CartBottomNav extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalPrice;
  const CartBottomNav(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("price", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("shipping ", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    Text("$shipping \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("Total Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalPrice \$",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor)))
          ],
        ),
        const SizedBox(height: 10),
        CartBottomPart(
          textButton: "Place Order",
          onPressed: () {},
        )
      ],
    );
  }
}
