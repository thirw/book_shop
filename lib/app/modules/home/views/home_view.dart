import 'package:book_shop/app/modules/app_drawer/views/app_drawer_view.dart';
import 'package:book_shop/app/modules/cart/controllers/cart_controller.dart';
import 'package:book_shop/app/modules/home/controllers/home_controller.dart';
import 'package:book_shop/app/modules/home/views/widgets/products_list.dart';
import 'package:book_shop/app/modules/home/views/widgets/shopping_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.find<HomeController>();
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Shop'),
        actions: [
          Obx(() => ShoppingButton(
                value: _cartController.items.length.toString(),
                onPress: _homeController.navigateToCart,
              )),
        ],
      ),
      drawer: AppDrawerView(),
      body: Obx(() => RefreshIndicator(
            key: _homeController.formKey,
            onRefresh: _homeController.refreshData,
            child: _homeController.isLoading
                ? Center(child: CircularProgressIndicator())
                : ProductsList(
                    productList: _homeController.products,
                  ),
          )),
    );
  }
}
