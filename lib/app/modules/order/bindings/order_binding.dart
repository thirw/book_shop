import 'package:book_shop/app/data/providers/order_provider.dart';
import 'package:book_shop/app/modules/app_drawer/controllers/app_drawer_controller.dart';
import 'package:book_shop/app/modules/order/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrderBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<AppDrawerController>(() => AppDrawerController());
    Get.lazyPut<OrderProvider>(() => OrderProvider());
  }
}