import 'package:book_shop/app/data/models/cart/cart.dart';
import 'package:book_shop/app/data/providers/order_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  final _items = <String, Cart>{}.obs;

  set items(value) => _items.value = value;

  Map<String, Cart> get items => _items;

  get itemsList => {..._items};

  final _isLoading = false.obs;

  set isLoading(value) => _isLoading.value = value;

  get isLoading => _isLoading.value;

  final OrderProvider _orderProvider = Get.find<OrderProvider>();

  void addItem(int productId, double price, String title) {
    if (items.containsKey(productId.toString())) {
      items.update(
          productId.toString(),
          (value) {
            print(value.quantity);
            return Cart(
                id: value.id,
                price: value.price,
                quantity: value.quantity + 1,
                title: value.title,
              );
          });
    } else {
      items.putIfAbsent(
          productId.toString(),
          () => Cart(
              id: productId,
              title: title,
              quantity: 1,
              price: price));
    }
    update();
  }

  double get totalAmount {
    var total = 0.0;
    items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    items.remove(productId);
    update();
  }

  void removeSingleItem(int productId) {
    final String id = productId.toString();
    if (!items.containsKey(id)) {
      return;
    }

    if (items[id]!.quantity > 1) {
      items.update(
          id,
          (value) => Cart(
                id: value.id,
                price: value.price,
                quantity: value.quantity,
                title: value.title,
              ));
    } else {
      items.remove(productId);
    }
    print(items);
    update();
  }

  void clear() {
    items.clear();
    update();
  }

  Future<void> addToOrder() async {
    isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartProduct = items.values.toList();
    final memberId = prefs.getInt('memberId');
    print(memberId);
    final data = {
      'id': memberId,
      'status': 'purchase',
      'books': cartProduct
          .map((cp) => {
                'id': cp.id,
                'quantity': cp.quantity,
              })
          .toList(),
    };
    print(data);
    final response = await _orderProvider.createOrder(data);
    if (response == 'success') {
      items.clear();
      itemsList.clear();

      Get.snackbar('Success', 'Order created', snackPosition: SnackPosition.BOTTOM);
    }
    isLoading = false;

    update();
  }
}
