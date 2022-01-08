import 'package:flutter/material.dart';

class ShoppingButton extends StatelessWidget {
  final String value;
  final VoidCallback onPress;
  final Color? color;

  const ShoppingButton({Key? key, required this.onPress, required this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPress,
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // color: color != null ? color : Theme.of(context).accentColor,
                color: Colors.deepOrange),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
