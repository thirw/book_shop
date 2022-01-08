import 'package:book_shop/app/data/providers/order_provider.dart';
import 'package:book_shop/app/data/providers/product_provider.dart';
import 'package:book_shop/app/modules/app_drawer/controllers/app_drawer_controller.dart';
import 'package:book_shop/app/modules/cart/controllers/cart_controller.dart';
import 'package:book_shop/app/modules/home/controllers/home_controller.dart';
import 'package:book_shop/app/modules/order/controllers/order_controller.dart';
import 'package:get/get.dart';

class AppDrawerBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppDrawerController>(() => AppDrawerController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductProvider>(() => ProductProvider());
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<CartController>(() => CartController());
  }
}