import 'package:ezone/controller/orders/orders_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/view_modules/orders/widgets/order_raring.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../model/orders/orders_model.dart';

class CardOrdersListArchive extends GetView<OrdersCont> {
  final OrdersModel ordersModel;
  @override
  final OrdersCont controller;
  const CardOrdersListArchive(
      {Key? key, required this.ordersModel, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${ordersModel.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    Jiffy(ordersModel.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.orderType(ordersModel.ordersType!)}"),
              Text("Order Price : ${ordersModel.ordersPrice} \$"),
              Text("Delivery Price : ${ordersModel.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.paymentMethod(ordersModel.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.ordersStatus(ordersModel.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${ordersModel.ordersTotalprice} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  ordersModel.ordersRating == 0
                      ? OrderRating(
                          controller: controller, ordersModel: ordersModel)
                      : const Icon(
                          Icons.done,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      controller.goToOrderDetails(
                          ordersModel.ordersId,
                          ordersModel.ordersTotalprice,
                          ordersModel.addressName,
                          ordersModel.addressCity,
                          ordersModel.addressStreet,
                          ordersModel.ordersPricedelivery);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
