import 'package:ezone/core/constants/routes.dart';
import 'package:ezone/core/constants/theme.dart';
import 'package:ezone/core/localization/translation.dart';
import 'package:ezone/core/services/services.dart';
import 'package:ezone/view/language.dart';
import 'package:ezone/view/view_modules/auth/screens/login.dart';
import 'package:ezone/view/view_modules/home_page/screens/bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => Services().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Services services = Get.put(Services());
    String? lang = services.sharedPref?.getString("lang");
    String? userId = services.sharedPref?.getString("userId");
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: lang != null
              ? userId == null
                  ? Login()
                  : const BottomNav()
              : Language(),
          routes: routes,
          theme: lang == null || lang == "EN" ? englishTheme : arabicTheme,
          translations: MyTranslation(),
          locale: lang == null ? const Locale("EN") : Locale(lang),
        );
      },
    );
  }
}
