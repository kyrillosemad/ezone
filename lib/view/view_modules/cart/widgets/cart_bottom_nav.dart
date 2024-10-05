import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_bottom_part.dart';
import 'package:ezone/view/view_modules/cart/widgets/check_coupon.dart';
import 'package:flutter/material.dart';

class CartBottomNav extends StatelessWidget {
  final String price;
  final String shipping;
  final String discount;
  final String totalPrice;
  final CartCont controller;
  const CartBottomNav(
      {Key? key,
      required this.price,
      required this.controller,
      required this.discount,
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
                child: const Text("Discount", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("- $discount %",
                    style: const TextStyle(fontSize: 16, color: Colors.green)))
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
                child: Text("+ $shipping \$",
                    style: const TextStyle(fontSize: 16)))
          ],
        ),
        const Divider(
          thickness: 1,
          color: AppColor.grey,
        ),
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
        const SizedBox(height: 8),
        CheckCoupon(
          controller: controller,
        ),
        const SizedBox(
          height: 5,
        ),
        CartBottomPart(
          textButton: "Place Order",
          onPressed: () {
            controller.goToPlaceOrder(context, discount.toString());
          },
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
