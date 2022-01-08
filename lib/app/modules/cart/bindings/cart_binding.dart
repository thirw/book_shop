import 'package:book_shop/app/data/providers/order_provider.dart';
import 'package:book_shop/app/modules/app_drawer/controllers/app_drawer_controller.dart';
import 'package:book_shop/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<AppDrawerController>(() => AppDrawerController());
  }
}