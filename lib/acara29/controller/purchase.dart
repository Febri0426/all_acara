import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/product.dart';

class PurchaseController extends GetxController {
  final box = GetStorage();

  var cart = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void addToCart(Product product) {
    cart.add(product);

    box.write(
      'cart',
      cart.map((e) => e.toJson()).toList(),
    );

    Get.snackbar(
      "Berhasil",
      "${product.productName} ditambahkan ke keranjang",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void loadCart() {
    List? savedCart = box.read('cart');
    if (savedCart != null) {
      cart.value = savedCart
          .map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    box.write(
      'cart',
      cart.map((e) => e.toJson()).toList(),
    );
  }

  int get totalItem => cart.length;

  double get totalPrice =>
      cart.fold(0.0, (sum, item) => sum + item.price);
}