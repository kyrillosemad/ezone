import 'package:ezone/core/constants/routes_name.dart';
import 'package:ezone/view/view_modules/address/screens/new_address.dart';
import 'package:ezone/view/view_modules/address/screens/view_addresses.dart';
import 'package:ezone/view/view_modules/auth/screens/email_verify_code.dart';
import 'package:ezone/view/view_modules/auth/screens/forget_password.dart';
import 'package:ezone/view/view_modules/auth/screens/login.dart';
import 'package:ezone/view/view_modules/auth/screens/reset_password.dart';
import 'package:ezone/view/view_modules/auth/screens/signup.dart';
import 'package:ezone/view/view_modules/auth/screens/pas_verify_code.dart';
import 'package:ezone/view/view_modules/cart/screens/cart_page.dart';
import 'package:ezone/view/view_modules/checkout/screens/checkout.dart';
import 'package:ezone/view/view_modules/home_page/screens/bottom_appbar.dart';
import 'package:ezone/view/view_modules/home_page/screens/favorite_page.dart';
import 'package:ezone/view/view_modules/home_page/screens/home_page.dart';
import 'package:ezone/view/view_modules/item_details/screens/item_details.dart';
import 'package:ezone/view/view_modules/items/screens/items_page.dart';
import 'package:ezone/view/view_modules/home_page/screens/profile_page.dart';
import 'package:ezone/view/view_modules/home_page/screens/settings_page.dart';
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
  AppRoutes().bottomAppBar: (context) => const BottomNav(),
  AppRoutes().homePage: (context) => const HomePage(),
  AppRoutes().settings: (context) => const SettingsPage(),
  AppRoutes().profile: (context) => const ProfilePage(),
  AppRoutes().favorite: (context) => const FavoritePage(),
  AppRoutes().items: (context) => const ItemsPage(),
  AppRoutes().itemDetails: (context) => const ItemDetails(),
  AppRoutes().cart: (context) => const CartPage(),
  AppRoutes().addNewAddress: (context) => const AddressAddDetails(),
  AppRoutes().viewAllAddresses: (context) => const AddressView(),
  AppRoutes().checkout: (context) => const Checkout(),
};
