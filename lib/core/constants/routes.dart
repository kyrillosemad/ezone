import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/view/view_modules/auth/screens/email_verify_code.dart';
import 'package:ezone/view/view_modules/auth/screens/forget_password.dart';
import 'package:ezone/view/view_modules/auth/screens/login.dart';
import 'package:ezone/view/view_modules/auth/screens/reset_password.dart';
import 'package:ezone/view/view_modules/auth/screens/signup.dart';
import 'package:ezone/view/view_modules/auth/screens/pas_verify_code.dart';
import 'package:ezone/view/view_modules/home_page/screens/home_page.dart';
import 'package:ezone/view/view_modules/on_boarding/screens/on_boarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().login: (context) => Login(),
  AppRoutes().onBoarding: (context) => const OnBoarding(),
  AppRoutes().signUp: (context) => SignUp(),
  AppRoutes().forgetPassword: (context) => ForgetPassword(),
  AppRoutes().passVerifyCode: (context) => PasVerifyCode(),
  AppRoutes().resetPassword: (context) => ResetPassword(),
  AppRoutes().emailVerifyCode: (context) => EmailVerifyCode(),
  AppRoutes().homePage: (context) => const HomePage(),
};
