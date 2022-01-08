import 'package:book_shop/app/modules/cart/controllers/cart_controller.dart';
import 'package:book_shop/app/modules/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Obx(
                    () => Chip(
                      label: Text(
                        '\$${_cartController.totalAmount}',
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextButton(
                      onPressed: _cartController.addToOrder,
                      child: Obx(() => _cartController.isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              'ORDER NOW',
                              style: TextStyle(
                                color: _cartController.totalAmount <= 0
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                              ),
                            ))),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: _cartController.itemsList.length,
                itemBuilder: (ctx, index) => CartItem(
                  productId: _cartController.items.values.toList()[index].id,
                  quantity:
                      _cartController.items.values.toList()[index].quantity,
                  price: _cartController.items.values.toList()[index].price,
                  title: _cartController.items.values.toList()[index].title,
                  onRemoveItem: (val) => _cartController.removeItem(val),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
