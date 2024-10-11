// ignore_for_file: non_constant_identifier_names

import 'package:ezone/controller/orders/orders_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/orders/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListPending extends GetView<OrdersCont> {
  final OrdersModel OrderModel;
  final int index;
  const CardOrdersListPending(
      {Key? key, required this.OrderModel, required this.index})
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
                  Text("Order Number : #${OrderModel.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    Jiffy(OrderModel.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.orderType(OrderModel.ordersType!)}"),
              Text("Order Price : ${OrderModel.ordersPrice!.toDouble()} \$"),
              Text(
                  "Delivery Price : ${OrderModel.ordersPricedelivery?.toDouble()} \$ "),
              Text(
                  "Payment Method : ${controller.paymentMethod(OrderModel.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.ordersStatus(OrderModel.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text(
                      "Total Price : ${OrderModel.ordersTotalprice!.toDouble()} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      controller.goToOrderDetails(
                          OrderModel.ordersId,
                          OrderModel.ordersTotalprice,
                          OrderModel.addressName,
                          OrderModel.addressCity,
                          OrderModel.addressStreet,
                          OrderModel.ordersPricedelivery);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (OrderModel.ordersStatus == 1)
                    IconButton(
                      onPressed: () {
                        controller.deleteOrder(
                            OrderModel.ordersId.toString(), index);
                      },
                      color: AppColor.primaryColor,
                      icon: const Icon(Icons.delete),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
