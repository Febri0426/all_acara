import 'package:flutter/material.dart';

class Acara18Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACARA 18 - Routing"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Tap untuk ke About Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AboutPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
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
