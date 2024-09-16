import 'package:ezone/core/constants/routes_name.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingCont extends GetxController {
/////////////////////////////////////////////////////////////////////
  var pageController = PageController();

/////////////////////////////////////////////////////////////////////
  var lastPage = false.obs;

/////////////////////////////////////////////////////////////////////
  void onPageChanged(int index) {
    if (index == 2) {
      lastPage.value = true;
    } else {
      lastPage.value = false;
    }
  }

/////////////////////////////////////////////////////////////////////
  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

/////////////////////////////////////////////////////////////////////
  void goToHomePage() {
    Get.offAllNamed(AppRoutes().login);
  }
}
