import 'package:book_shop/app/modules/app_drawer/bindings/app_drawer_binding.dart';
import 'package:book_shop/app/modules/app_drawer/views/app_drawer_view.dart';
import 'package:book_shop/app/modules/cart/bindings/cart_binding.dart';
import 'package:book_shop/app/modules/cart/views/cart_view.dart';
import 'package:book_shop/app/modules/home/bindings/home_binding.dart';
import 'package:book_shop/app/modules/home/views/home_view.dart';
import 'package:book_shop/app/modules/order/bindings/order_binding.dart';
import 'package:book_shop/app/modules/order/views/order_view.dart';
import 'package:book_shop/app/modules/signin/bindings/sigin_binding.dart';
import 'package:book_shop/app/modules/signin/views/sigin_view.dart';
import 'package:get/get.dart';

part './app_rotes.dart';

abstract class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.APPDRAWER,
      page: () => AppDrawerView(),
      binding: AppDrawerBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.SIGNIN,
      page: () => SignInView(),
      binding: SigInBinding(),
    ),
    GetPage(
      name: AppRoutes.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
