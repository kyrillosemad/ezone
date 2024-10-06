import 'package:ezone/controller/orders/orders_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/model/orders/orders_model.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:ezone/view/view_modules/orders/widgets/card_orders_list_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrdersCont controller = Get.put(OrdersCont());
    controller.getPendingOrders();
    return Scaffold(
        appBar: const CustomAppBar2(title: "orders"),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersCont>(
              builder: ((controller) => HandlingDataView(
                  reqStatus: controller.reqStatus.value,
                  widget: ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: ((context, index) {
                      OrdersModel ordersModel =
                          OrdersModel.fromJson(controller.orders[index]);
                      return CardOrdersListPending(
                          OrderModel: ordersModel, index: index);
                    }),
                  )))),
        ));
  }
}