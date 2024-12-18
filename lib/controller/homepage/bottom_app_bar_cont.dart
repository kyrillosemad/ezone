import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/view/view_modules/home_page/screens/home_page.dart';
import 'package:ezone/view/view_modules/home_page/screens/offers_page.dart';
import 'package:ezone/view/view_modules/home_page/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class BottomNavCont extends GetxController {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const HomePage(),
      const OffersPage(),
      const SettingsPage(),
    ];
  }

  onTap(index) {
    controller = PersistentTabController(initialIndex: index);
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grey,
          icon: const Icon(Icons.home),
          title: "Home",
          textStyle: TextStyle(fontSize: 15.sp)),
      PersistentBottomNavBarItem(
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grey,
          icon: const Icon(Icons.local_offer_outlined),
          title: "Offers",
          textStyle: TextStyle(fontSize: 15.sp)),
      PersistentBottomNavBarItem(
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grey,
          icon: const Icon(Icons.settings),
          title: "Settings",
          textStyle: TextStyle(fontSize: 15.sp)),
    ];
  }
}
