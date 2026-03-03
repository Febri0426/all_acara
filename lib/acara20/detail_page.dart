import 'package:flutter/material.dart';

class DetailPage20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Kembali"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
