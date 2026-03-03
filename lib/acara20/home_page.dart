import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Ke Detail Page"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailPage20()),
          );
        },
      ),
    );
  }
}
