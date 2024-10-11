import 'package:ezone/controller/orders/orders_detatils.cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsCont controller = Get.put(OrderDetailsCont());
    controller.getOrderDetails();
    return Scaffold(
      appBar: const CustomAppBar2(title: "Order Details"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrderDetailsCont>(
            builder: ((controller) => HandlingDataView(
                reqStatus: controller.reqStatus.value,
                widget: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                  controller.details.length,
                                  (index) => TableRow(children: [
                                        Text(
                                            "${controller.details[index]['items_name']}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.details[index]['countitems']}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.details[index]['itemsprice']} \$",
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Shipping Price : ${controller.orderShippingPrice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle()),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Total Price : ${controller.orderTotalPrice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  if (controller.orderAddressName != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 22, color: AppColor.primaryColor),
                        ),
                        Card(
                            child: ListTile(
                          title: const Text("Shipping Address",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.orderAddressCity} , ${controller.orderAddressStreet}"),
                        )),
                      ],
                    )
                ])))),
      ),
    );
  }
}
