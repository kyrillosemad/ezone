// ignore_for_file: unrelated_type_equality_checks
import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/model/cart/cart_model.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_bottom_nav.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_items_list.dart';
import 'package:ezone/view/view_modules/cart/widgets/cart_top_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCont controller = Get.put(CartCont());
    controller.viewCartData();
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar2(title: "My Cart"),
        bottomNavigationBar: Obx(() {
          if (controller.reqStatus == Status.internetFailure) {
            return Center(
              child: Lottie.asset("assets/lottie/offline.json", height: 170),
            );
          } else if (controller.reqStatus == Status.serverFailure) {
            return Center(
              child: Lottie.asset("assets/lottie/server.json", height: 200),
            );
          } else if (controller.reqStatus == Status.loading) {
            return Center(
              child: Lottie.asset("assets/lottie/cart.json", height: 140),
            );
          } else if (controller.reqStatus == Status.success) {
            return CartBottomNav(
              price: controller.totalCartData['totalprice']?.toString() ?? '0',
              shipping: "300",
              totalPrice: controller.totalCartData['totalprice'] != null
                  ? "${controller.totalCartData['totalprice'] + 300}"
                  : "300",
            );
          } else if (controller.reqStatus == Status.empty) {
            return Center(
              child: Lottie.asset("assets/lottie/noData.json", height: 200),
            );
          } else {
            return Container();
          }
        }),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.reqStatus == Status.internetFailure) {
                  return Center(
                    child:
                        Lottie.asset("assets/lottie/offline.json", height: 170),
                  );
                } else if (controller.reqStatus == Status.serverFailure) {
                  return Center(
                    child:
                        Lottie.asset("assets/lottie/server.json", height: 200),
                  );
                } else if (controller.reqStatus == Status.loading) {
                  print("ho");
                  return Center(
                    child: Lottie.asset("assets/lottie/cart.json", height: 140),
                  );
                } else if (controller.reqStatus == Status.success) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CartTopCard(
                        message:
                            "You Have ${controller.totalCartData['totalcount']} Items in Your List",
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.cartItemsData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  CartModel cartModel = CartModel.fromJson(
                                      controller.cartItemsData[index]);
                                  return CartItemsList(
                                    onAdd: () {
                                      controller.addToCart(
                                          cartModel.itemsId, context);
                                    },
                                    onRemove: () {
                                      controller.deleteFromCart(
                                          cartModel.itemsId, context);
                                    },
                                    image: cartModel.itemsImage.toString(),
                                    name: "${cartModel.itemsName}",
                                    price: "${cartModel.itemsPrice}",
                                    count: "${cartModel.countitems}",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (controller.reqStatus == Status.empty) {
                  return Center(
                    child:
                        Lottie.asset("assets/lottie/noData.json", height: 200),
                  );
                } else {
                  return Container();
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
