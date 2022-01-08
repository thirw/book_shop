import 'package:book_shop/app/constants/api_path.dart';
import 'package:book_shop/app/data/models/book/book.dart';
import 'package:book_shop/app/data/network/api_base_helper.dart';

class ProductProvider {
  ApiBaseHelper api = ApiBaseHelper();

  Future<dynamic> getAllProducts() async {
    try {
      final response = await api.get(url: ApiPath.GET_ALL_BOOKS);
      print(response!.data);
      final booksList =
          (response.data as List).map((e) => Book.fromJson(e)).toList();
      return booksList;
    } catch (error) {
      return error;
    }
  }
}
