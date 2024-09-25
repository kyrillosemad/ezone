import 'package:ezone/controller/item_details/item_details_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemList extends StatelessWidget {
  const SubItemList({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsCont controller = Get.put(ItemDetailsCont());
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 50,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColor.fourthColor
                    : Colors.white,
                border: Border.all(color: AppColor.fourthColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(controller.subitems[index]['name'],
                style: TextStyle(
                    color: controller.subitems[index]['active'] == "1"
                        ? Colors.white
                        : AppColor.fourthColor,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
