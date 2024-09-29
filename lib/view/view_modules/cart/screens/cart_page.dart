import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_app_bar.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_bottom_nav.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_items_list.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_top_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCont cartController = Get.put(CartCont());
    cartController.viewCartData();
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: const CartBottomNav(
              price: "1200", shipping: "300", totalPrice: "1500"),
          body: Column(
            children: [
              const CartAppBar(
                title: 'My Cart',
              ),
              const CartTopCard(message: "You Have  Items in Your List"),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return const CartItemsList(
                              name: "mac book", price: "200", count: "4");
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
