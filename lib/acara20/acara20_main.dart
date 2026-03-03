import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'akun_page.dart';

class Acara20Main extends StatefulWidget {
  @override
  State<Acara20Main> createState() => _Acara20MainState();
}

class _Acara20MainState extends State<Acara20Main> {
  int _index = 0;

  final List<Widget> _pages = [
    HomePage20(),
    SearchPage20(),
    AkunPage20(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACARA 20"),
      ),

      // 🔹 DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Belajar Flutter"),
              accountEmail: Text("halo@belajarflutter.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                setState(() => _index = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              onTap: () {
                setState(() => _index = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Akun"),
              onTap: () {
                setState(() => _index = 2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // 🔹 BODY
      body: _pages[_index],

      // 🔹 BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Akun",
          ),
        ],
      ),
    );
  }
}
