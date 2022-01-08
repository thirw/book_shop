import 'dart:math';

import 'package:book_shop/app/data/models/order/order.dart' as ord;
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderByID orders;
  final String totalPrice;

  const OrderItem(
      {Key? key,
      required this.totalPrice,
      required this.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$$totalPrice',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(orders.books.length * 20.0 + 10, 100),
            child: ListView(
              children: orders.books
                  .map((item) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${item.quantity}x \$${item.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
