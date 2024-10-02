import 'package:ezone/controller/address/address_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:ezone/view/view_modules/auth/widgets/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressCont controller = Get.put(AddressCont());
    return Scaffold(
        appBar: const CustomAppBar2(title: "Add New Address"),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormAuth(
                obscure: false,
                hintText: "Name",
                labelText: "Name",
                iconData: Icons.location_history,
                myController: controller.name,
                valid: (val) {
                  return null;
                },
                isNumber: false),
            CustomTextFormAuth(
                obscure: false,
                hintText: "City",
                labelText: "City",
                iconData: Icons.location_city,
                myController: controller.city,
                valid: (val) {
                  return null;
                },
                isNumber: false),
            CustomTextFormAuth(
                obscure: false,
                hintText: "Street",
                labelText: "Street",
                iconData: Icons.near_me,
                myController: controller.street,
                valid: (val) {
                  return null;
                },
                isNumber: false),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                controller.addNewAddress(context);
              },
              child: Center(
                child: Container(
                  width: 55.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      "Add New Address",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
