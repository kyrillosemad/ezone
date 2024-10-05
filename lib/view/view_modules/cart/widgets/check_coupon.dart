import 'package:ezone/controller/cart/cart_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CheckCoupon extends StatelessWidget {
  final CartCont controller;
  const CheckCoupon({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            title: "Coupon",
            titleStyle: const TextStyle(color: AppColor.primaryColor),
            content: Column(
              children: [
                Container(
                  height: 6.h,
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextFormField(
                    controller: controller.couponNameCont,
                    cursorHeight: 3.h,
                    cursorColor: AppColor.primaryColor,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.discount,
                          color: AppColor.primaryColor,
                        ),
                        label: Text(
                          "Coupon Name",
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: AppColor.fourthColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: AppColor.fourthColor))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    controller.checkCoupon(
                        controller.couponNameCont.text, context);
                    Get.back();
                  },
                  child: Container(
                    width: 40.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Check Coupon",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
      child: const Text(
        "Do You Have Coupon ?",
        style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
      ),
    );
  }
}
