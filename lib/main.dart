import 'package:book_shop/app/modules/signin/controllers/signin_controller.dart';
import 'package:book_shop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/core/locales.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final isLoggedIn = preferences.getBool('isLoggedIn');
  await initializeBindings();
  runApp(GetMaterialApp(
    defaultTransition: Transition.fade,
    getPages: AppPage.pages,
    translationsKeys: AppTranslation.translations,
    initialRoute: isLoggedIn == true ? AppRoutes.HOME : AppRoutes.SIGNIN,
  ));
}

initializeBindings() async {
  // inject authentication controller
  Get.put(SignInController());

  final signInController = Get.put(SignInController());
  await signInController.initAnimationController();
}
