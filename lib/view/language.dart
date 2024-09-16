// ignore_for_file: must_be_immutable
import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/core/localization/change_locale.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/view/shared_widgets/lang_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Language extends StatelessWidget {
  Language({super.key});
  final Services services = Get.put(Services());
  LocaleClass controller = Get.put(LocaleClass());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////
            SizedBox(
              height: 5.h,
            ),
            //////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////
            LangButton(
                fun: () {
                  controller.changeLocale("AR");
                  controller.curLang = "AR";
                },
                lang: "2".tr),
            //////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////
            SizedBox(
              height: 1.h,
            ),
            //////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////
            LangButton(
                fun: () {
                  controller.changeLocale("EN");
                  controller.curLang = "EN";
                },
                lang: "3".tr),
            //////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////

            SizedBox(
              height: 5.h,
            ),

            /////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////
            InkWell(
              onTap: () async {
                if (services.sharedPref != null) {
                  await services.sharedPref!
                      .setString("lang", controller.curLang);
                }
                Get.toNamed(AppRoutes().onBoarding);
              },
              child: Container(
                width: 60.w,
                height: 6.h,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 255, 205),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "4".tr,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
