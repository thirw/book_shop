import 'package:book_shop/app/modules/signin/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SigInBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}