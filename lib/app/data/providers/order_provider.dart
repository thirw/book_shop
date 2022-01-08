import 'dart:convert';

import 'package:book_shop/app/constants/api_path.dart';
import 'package:book_shop/app/data/models/order/order.dart';
import 'package:book_shop/app/data/network/api_base_helper.dart';

class OrderProvider {
  ApiBaseHelper api = ApiBaseHelper();

  Future<dynamic> createOrder(Map<String, dynamic> data) async {
    try {
      final response =
          await api.post(url: ApiPath.ORDER, data: jsonEncode(data));
      if (response!.statusCode == 200) {
        return 'success';
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> getOrderById(String id) async {
    try {
      final queryParams = {'member': id};
      final response = await api.getQueryParameter(
        url: ApiPath.ORDER,
        queryParams: queryParams,
      );
      final data = (response!.data as List);
      final orderResponse = data
          .map((e) => OrderByID.fromJson(e as Map<String, dynamic>))
          .toList();
      return orderResponse;
    } catch (e) {
      return e;
    }
  }
}
