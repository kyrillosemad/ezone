import 'package:ezone/controller/orders/orders_cont.dart';
import 'package:ezone/controller/settings/settings_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/images.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsCont controller = Get.put(SettingsCont());
    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: Get.width / 2.2,
          ),
          Positioned(
              top: Get.width / 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImages().logo)),
              )),
        ]),
        const SizedBox(height: 90),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              onTap: () {
                Get.toNamed(AppRoutes().viewAllAddresses);
              },
              trailing: const Icon(Icons.location_on_outlined),
              title: const Text("Address"),
            ),
            ListTile(
              onTap: () {
                Get.delete<OrdersCont>();
                Get.toNamed(AppRoutes().pendingOrders);
              },
              trailing: const Icon(Icons.shopping_bag_outlined),
              title: const Text("Orders"),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoutes().cart);
              },
              trailing: const Icon(Icons.shopping_cart_outlined),
              title: const Text("Cart"),
            ),
            ListTile(
              onTap: () {
                Get.delete<OrdersCont>();
                Get.toNamed(AppRoutes().archiveOrders);
              },
              trailing: const Icon(Icons.history),
              title: const Text("History"),
            ),
            ListTile(
              onTap: () {
                Get.defaultDialog(
                    title: "Kyrillos Emad",
                    content: const Column(
                      children: [
                        Text(
                          "Flutter Developer",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Tel:01147910957",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Email:kyrillos243648@gmail.com",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ));
              },
              trailing: const Icon(Icons.help_outline_rounded),
              title: const Text("About us"),
            ),
            ListTile(
              onTap: () {
                controller.contactUs();
              },
              trailing: const Icon(Icons.phone_callback_outlined),
              title: const Text("Contact us"),
            ),
            ListTile(
              onTap: () {
                controller.logout();
              },
              title: const Text("Logout"),
              trailing: const Icon(Icons.exit_to_app),
            ),
          ]),
        ),
      ],
    );
  }
}
