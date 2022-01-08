import 'dart:convert';

import 'package:book_shop/app/constants/api_path.dart';
import 'package:book_shop/app/data/models/user/user.dart';
import 'package:book_shop/app/data/network/api_base_helper.dart';

class SignInProvider {
  ApiBaseHelper api = ApiBaseHelper();

  Future onSingIn(Map<String, String> data) async {
    try {
      final response = await api.post(url: ApiPath.SIGNIN, data: jsonEncode(data));
      User userResponse = User.fromJson(response!.data);
      return userResponse;
    } catch (e) {
      throw (e);
    }
  }
}
