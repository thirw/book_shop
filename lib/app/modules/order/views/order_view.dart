import 'package:book_shop/app/data/models/order/order.dart';
import 'package:book_shop/app/modules/app_drawer/views/app_drawer_view.dart';
import 'package:book_shop/app/modules/order/controllers/order_controller.dart';
import 'package:book_shop/app/modules/order/views/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderController> {
  final OrderController _orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawerView(),
      body: Obx(() => _orderController.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GetBuilder<OrderController>(
              builder: (controller) => ListView.builder(
                itemCount: controller.orders.length,
                itemBuilder: (ctx, index) {
                  return OrderItem(
                    totalPrice: controller.sumTotalPrice(controller.orders[index]),
                  orders: controller.orders[index],
                );
                },
              ),
            ),
    ));
  }
}
