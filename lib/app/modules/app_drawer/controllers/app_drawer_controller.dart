import 'package:book_shop/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawerController extends GetxController {

  void navigateToHome() {
    Get.offNamed(AppRoutes.HOME);
  }

  void navigateToOrder() {
    Get.offNamed(AppRoutes.ORDER);
  }

  void onLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.SIGNIN);
  }
}