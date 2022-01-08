import 'dart:convert';

import 'package:book_shop/app/constants/api_path.dart';
import 'package:book_shop/app/data/network/api_base_helper.dart';

class SignUpProvider {
  ApiBaseHelper api = ApiBaseHelper();

  Future onSingUp(Map<String, String> data) async {
    try {
      final response = await api.post(url: ApiPath.SIGNUP, data: jsonEncode(data));
      if (response!.statusCode == 200) {
       return 'success';
      }
    } catch (e) {
      throw (e);
    }
  }
}