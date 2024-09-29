import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/controller/item_details/item_details_cont.dart';
import 'package:ezone/core/classes/status.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/view/view_modules/item_details/widgets/item_price_and_count.dart';
import 'package:ezone/view/view_modules/item_details/widgets/sub_item_list.dart';
import 'package:ezone/view/view_modules/item_details/widgets/top_Item_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCont cartController = Get.put(CartCont());
    ItemDetailsCont itemDetailsController = Get.put(ItemDetailsCont());
    cartController.getTotalItemCount(itemDetailsController.itemsModel.itemsId);

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoutes().cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: ListView(children: [
          TopItemDetailsPage(itemsModel: itemDetailsController.itemsModel),
          const SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${itemDetailsController.itemsModel.itemsName}",
                  style: const TextStyle(
                      fontSize: 40,
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Obx(() {
                return ItemPriceAndCount(
                  onAdd: () {
                    cartController.addToCart(
                        itemDetailsController.itemsModel.itemsId, context);
                  },
                  onRemove: () {
                    if (cartController.totalItemCount > 0) {
                      cartController.deleteFromCart(
                          itemDetailsController.itemsModel.itemsId, context);
                    }
                  },
                  price: "${itemDetailsController.itemsModel.itemsPrice}",
                  count: cartController.reqStatus.value == Status.loading
                      ? ""
                      : "${cartController.totalItemCount}",
                );
              }),
              const SizedBox(height: 25),
              Text("${itemDetailsController.itemsModel.itemsDesc}",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 40),
              const SubItemList()
            ]),
          )
        ]));
  }
}
