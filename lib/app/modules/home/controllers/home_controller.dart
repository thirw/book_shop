import 'package:book_shop/app/data/models/book/book.dart';
import 'package:book_shop/app/data/providers/product_provider.dart';
import 'package:book_shop/app/modules/cart/controllers/cart_controller.dart';
import 'package:book_shop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CartController _cartController = Get.find<CartController>();

  final ProductProvider _productProvider = Get.find<ProductProvider>();

  final _products = <Book>[].obs;

  get products => _products;

  set products(val) => _products.value = val;

  final _isLoading = false.obs;

  set isLoading(value) => _isLoading.value = value;

  get isLoading => _isLoading.value;

  final _formKey = GlobalKey<FormState>().obs;

  get formKey => _formKey.value;

  set formKey(val) => _formKey.value = val;


  @override
  void onInit() {
    // TODO: implement onInit
    getAllProducts();
    super.onInit();
  }

  void navigateToCart() {
    Get.toNamed(AppRoutes.CART);
  }

  void addToCart(
      BuildContext context, int productID, double price, String title) {
    _cartController.addItem(productID, price, title);
    Get.snackbar('Add Book', 'Added book to cart.', snackPosition: SnackPosition.BOTTOM);
  }

  Future<dynamic> getAllProducts() async {
    isLoading = true;
    final response = await _productProvider.getAllProducts();
    products = response;
    isLoading = false;
    update();
  }

  Future<dynamic> refreshData() async {
    return await Future.delayed(Duration(seconds: 0), () async {
      await getAllProducts();
    });
  }
}
