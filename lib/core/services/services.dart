  import 'package:get/get.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class Services extends GetxService {
    SharedPreferences? sharedPref;

    Future<Services> init() async {
      sharedPref = await SharedPreferences.getInstance();
      return this;
    }
  }


