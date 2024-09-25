import 'package:ezone/controller/homepage/home_page_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/view/view_modules/home_page/widgets/categories_list_home.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_appbar.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_card_home.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_title_home.dart';
import 'package:ezone/view/view_modules/home_page/widgets/items_list_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/classes/status.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageCont controller = Get.put(HomePageCont());
    controller.getHomePageData();
    return Obx(() {
      if (controller.reqStatus.value == Status.internetFailure) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/offline.json", height: 200),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40.w,
                  height: 6.h,
                  child: const Center(
                      child: Text(
                    "Refresh",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
              onTap: () {
                Get.delete<HomePageCont>();
                Get.offAllNamed(AppRoutes().bottomAppBar);
              },
            ),
          ],
        ));
      } else if (controller.reqStatus.value == Status.loading) {
        return Center(
            child: Lottie.asset("assets/lottie/loading.json", height: 190));
      } else if (controller.reqStatus.value == Status.success) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
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
                const ListCategoriesHome(),
                const CustomTitleHome(title: "Products for You"),
                const ListItemsHome(),
                const CustomTitleHome(title: "Offers"),
                const ListItemsHome(),
              ],
            ),
          ),
        );
      } else {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/server.json", height: 200),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40.w,
                  height: 6.h,
                  child: const Center(
                      child: Text(
                    "Refresh",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
              onTap: () {
                Get.delete<HomePageCont>();
                Get.offAllNamed(AppRoutes().bottomAppBar);
              },
            ),
          ],
        ));
      }
    });
  }
}
