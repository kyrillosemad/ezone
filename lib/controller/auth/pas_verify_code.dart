import 'package:ezone/core/constants/routes_name.dart';
import 'package:get/get.dart';

class PasVerifyCodeCont extends GetxController {
  checkCode() {}

  goToResetPassword() {
    Get.toNamed(AppRoutes().resetPassword);
    Get.delete<PasVerifyCodeCont>();
  }
}
