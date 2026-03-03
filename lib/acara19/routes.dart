import 'package:flutter/material.dart';
import 'screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Acara19HomePage(),
        );

      case '/about':
        return MaterialPageRoute(
          builder: (_) => AboutPage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text(
            '404 - Halaman Tidak Ditemukan',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
