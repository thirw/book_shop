import 'package:book_shop/app/modules/app_drawer/controllers/app_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawerView extends GetView<AppDrawerController> {
  final AppDrawerController _appDrawerController = Get.find<AppDrawerController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Book Shop'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: _appDrawerController.navigateToHome, // navigate to home
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: _appDrawerController.navigateToOrder, // navigate to order
          ),
          const Divider(),
          ListTile(
            leading:  Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: _appDrawerController.onLogOut, // navigate to sign in page
          ),
        ],
      ),
    );
  }
}
