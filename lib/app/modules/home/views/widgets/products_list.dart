import 'package:book_shop/app/data/models/book/book.dart';
import 'package:book_shop/app/modules/home/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final List<Book> productList;

  const ProductsList({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (ctx, index) => ProductItem(
        productID: productList[index].id,
        productPrice: productList[index].price,
        productTitle: productList[index].title,
      ),
    );
  }
}
