import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/model/cart/cart_model.dart';
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
    CartCont controller = Get.put(CartCont());
    controller.viewCartData();
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Obx(() {
            return HandlingDataView(
                reqStatus: controller.reqStatus.value,
                widget: CartBottomNav(
                  price:
                      controller.totalCartData['totalprice']?.toString() ?? '0',
                  shipping: "300",
                  totalPrice: controller.totalCartData['totalprice'] != null
                      ? "${controller.totalCartData['totalprice'] + 300}"
                      : "300",
                ));
          }),
          body: Column(
            children: [
              InkWell(
                onTap: () {},
                child: const CartAppBar(
                  title: 'My Cart',
                ),
              ),
              Expanded(
                child: Obx(() {
                  return HandlingDataView(
                      reqStatus: controller.reqStatus.value,
                      widget: Column(
                        children: [
                          CartTopCard(
                              message:
                                  "You Have ${controller.totalCartData['totalcount']} Items in Your List"),
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.cartItemsData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                                          image:
                                              cartModel.itemsImage.toString(),
                                          name: "${cartModel.itemsName}",
                                          price: "${cartModel.itemsPrice}",
                                          count: "${cartModel.countitems}");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ));
                }),
              )
            ],
          )),
    );
  }
}
