import 'package:ezone/controller/homepage/home_page_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/view_modules/home_page/widgets/categories_list_home.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_appbar.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_card_home.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_title_home.dart';
import 'package:ezone/view/view_modules/home_page/widgets/items_list_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/classes/status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageCont controller = Get.put(HomePageCont());
    controller.getHomePageData();
    return Obx(() {
      if (controller.reqStatus.value == Status.loading) {
        return const Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          )),
        );
      } else if (controller.reqStatus.value == Status.success) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomAppBar(
                    titleAppBar: "Find Product",
                    onPressedIcon: () {},
                    onPressedSearch: () {},
                  ),
                  const CustomCardHome(
                    title: "A summer surprise",
                    body: "Cashback 20%",
                  ),
                  const CustomTitleHome(title: "Categories"),
                  const SizedBox(height: 5),
                  const ListCategoriesHome(),
                  const SizedBox(height: 5),
                  const CustomTitleHome(title: "Products for You"),
                  const SizedBox(height: 5),
                  const ListItemsHome(),
                  const SizedBox(height: 5),
                  const CustomTitleHome(title: "Offers"),
                  const SizedBox(height: 5),
                  const ListItemsHome(),
                ],
              ),
            ),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text("Failed to load data. Please try again."),
          ),
        );
      }
    });
  }
}
