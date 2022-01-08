import 'package:book_shop/app/data/models/order/order.dart';
import 'package:book_shop/app/data/providers/order_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  final OrderProvider _orderProvider = Get.find<OrderProvider>();

  final _isLoading = false.obs;

  set isLoading(value) => _isLoading.value = value;

  get isLoading => _isLoading.value;

  final _orders = <OrderByID>[].obs;

  set orders(value) => _orders.value = value;

  get orders => _orders;

  @override
  void onInit() {
    // TODO: implement onInit
    getOrders();
    super.onInit();
  }

  Future<dynamic> getOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final memberId = prefs.getInt('memberId');
    isLoading = true;
    final List<OrderByID> response = await _orderProvider.getOrderById(memberId.toString());
    orders = response;
    isLoading = false;
    update();
  }

  String sumTotalPrice(OrderByID data) {
    double sumPrice = 0;
    final totalPriceList = data.books.map((e) => e.total).toList();
    for (double price in totalPriceList) {
      sumPrice +=price;
    }
    return sumPrice.toString();
  }

}
