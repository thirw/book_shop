import 'package:book_shop/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final HomeController _homeController = HomeController();
  final int productID;

  // final String productImage;
  final double productPrice;
  final String productTitle;

  ProductItem(
      {Key? key,
      required this.productID,
      required this.productPrice,
      required this.productTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Text(
                    productTitle.substring(0, 1),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '\$${productPrice.toString()}',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ],
                )),
                IconButton(
                    onPressed: () => _homeController.addToCart(
                          context,
                          productID,
                          productPrice,
                          productTitle,
                        ),
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.amber,
                      size: 32,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
