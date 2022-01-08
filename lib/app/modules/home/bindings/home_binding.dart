import 'package:book_shop/app/data/models/order/order.dart';
import 'package:book_shop/app/data/providers/order_provider.dart';
import 'package:book_shop/app/data/providers/product_provider.dart';
import 'package:book_shop/app/modules/app_drawer/controllers/app_drawer_controller.dart';
import 'package:book_shop/app/modules/cart/controllers/cart_controller.dart';
import 'package:book_shop/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppDrawerController>(() => AppDrawerController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<ProductProvider>(() => ProductProvider());
    Get.lazyPut<CartController>(() => CartController());
  }
}