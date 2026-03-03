import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class DemoController extends GetxController {

  var productList = <Product>[].obs;

  // ================= THEME =================
  var isDark = false.obs;

  void changeTheme(bool value) {
    isDark.value = value;

    Get.changeThemeMode(
      isDark.value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    await Future.delayed(Duration(seconds: 1));

    productList.value = [
      Product(
        1,
        "Laptop",
        "https://via.placeholder.com/150",
        "Laptop untuk programming",
        8000000.0,
      ),
      Product(
        2,
        "Mouse",
        "https://via.placeholder.com/150",
        "Mouse gaming",
        150000.0,
      ),
      Product(
        3,
        "Keyboard",
        "https://via.placeholder.com/150",
        "Keyboard mechanical",
        500000.0,
      ),
    ];
  }
}