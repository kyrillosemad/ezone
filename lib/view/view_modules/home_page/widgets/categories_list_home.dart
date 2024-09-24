import 'package:ezone/controller/homepage/home_page_cont.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/categories/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCategoriesHome extends GetView<HomePageCont> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const Categories({Key? key, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          width: 70,
          child: SvgPicture.network(
              "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor),
        ),
        Text(
          "${categoriesModel.categoriesName}",
          style: const TextStyle(fontSize: 13, color: AppColor.black),
        )
      ],
    );
  }
}
