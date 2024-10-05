import 'package:ezone/controller/checkout/checkout_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/images.dart';
import 'package:ezone/model/address/address_model.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:ezone/view/view_modules/checkout/widgets/delivery_type.dart';
import 'package:ezone/view/view_modules/checkout/widgets/payment_method.dart';
import 'package:ezone/view/view_modules/checkout/widgets/shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutCont controller = Get.put(CheckoutCont());

    return Scaffold(
      appBar: const CustomAppBar2(title: "Checkout"),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: MaterialButton(
          height: 6.h,
          color: AppColor.secondColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout(context);
          },
          child: const Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView(
          children: [
            const Text(
              "Choose Payment Method",
              style: TextStyle(
                color: AppColor.secondColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            // Ensure you are setting the value only inside a callback
            Obx(() => InkWell(
                  onTap: () {
                    // Trigger state change on user interaction
                    controller.choosePaymentMethod("0");
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Cash On Delivery",
                    isActive: controller.paymentMethod.value == "0",
                  ),
                )),
            const SizedBox(height: 10),

            Obx(() => InkWell(
                  onTap: () {
                    // Trigger state change on user interaction
                    controller.choosePaymentMethod("1");
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Payment Cards",
                    isActive: controller.paymentMethod.value == "1",
                  ),
                )),
            const SizedBox(height: 20),

            const Text(
              "Choose Delivery Type",
              style: TextStyle(
                color: AppColor.secondColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            Obx(() => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryMethod("0");
                      },
                      child: CardDeliveryTypeCheckout(
                        imageName: AppImages().delivery,
                        title: "Delivery",
                        active: controller.deliveryType.value == "0",
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryMethod("1");
                      },
                      child: CardDeliveryTypeCheckout(
                        imageName: AppImages().driveThru,
                        title: "DriveThru",
                        active: controller.deliveryType.value == "1",
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 20),

            Obx(() {
              if (controller.deliveryType.value == "0") {
                return HandlingDataView(
                  reqStatus: controller.reqStatus.value,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipping Address",
                        style: TextStyle(
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        controller.addresses.length,
                        (index) {
                          AddressModel addressModel = AddressModel.fromJson(
                              controller.addresses[index]);
                          return InkWell(
                            onTap: () {
                              controller.chooseShippingAddress(
                                  addressModel.addressId.toString());
                            },
                            child: CardShapingAddressCheckout(
                              title: "${addressModel.addressName}",
                              body:
                                  "${addressModel.addressCity} , ${addressModel.addressStreet}",
                              isActive: controller.shippingAddress.value ==
                                  addressModel.addressId.toString(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
