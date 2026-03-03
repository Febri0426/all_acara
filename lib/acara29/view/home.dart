import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/demoController.dart';
import '../controller/purchase.dart';

class Acara29Page extends StatelessWidget {

  final PurchaseController purchaseController = Get.put(PurchaseController());
  final DemoController demoController = Get.put(DemoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Produk"),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 5),
                Text(
                  purchaseController.totalItem.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: demoController.productList.length,
              itemBuilder: (context, index) {
                var product = demoController.productList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      product.productImage,
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.broken_image, size: 40);
                      },
                    ),
                    title: Text(product.productName),
                    subtitle: Text("Rp ${product.price}"),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        purchaseController.addToCart(product);
                      },
                    ),
                  ),
                );
              },
            )),
          ),

          // TOTAL HARGA DI BAWAH
          Obx(() => Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Text(
              "Total: Rp ${purchaseController.totalPrice}",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }
}