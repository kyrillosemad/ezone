import 'package:ezone/controller/items/items_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/categories/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends StatelessWidget {
  final ItemsCont controller;
  const ListCategoriesItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          CategoriesModel categoriesModel =
              CategoriesModel.fromJson(controller.categories[index]);
          return InkWell(
            onTap: () {
              controller.changeCat(index);
              controller.getItemsData(index + 1);
            },
            child: Column(
              children: [
                GetBuilder<ItemsCont>(
                    builder: (controller) => Container(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 5),
                          decoration: controller.selectedCat == index
                              ? const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 3,
                                          color: AppColor.primaryColor)))
                              : null,
                          child: Text(
                            "${categoriesModel.categoriesName}",
                            style: const TextStyle(
                                fontSize: 20, color: AppColor.grey2),
                          ),
                        ))
              ],
            ),
          );
        },
      ),
    );
  }
}
