import 'package:ezone/controller/homepage/bottom_app_bar_cont.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/core/functions/app_exit_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  BottomNavCont controller = Get.put(BottomNavCont());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: appExitAlert,
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: controller.controller,
          screens: controller.buildScreens(),
          items: controller.navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.white,
            border: Border.all(
              color: AppColor.primaryColor,
              width: 1,
            ),
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style13,
        ),
      ),
    );
  }
}
