import 'package:flutter/material.dart';

class Acara22Page extends StatefulWidget {
  @override
  _Acara22PageState createState() => _Acara22PageState();
}

class Halamandua extends StatelessWidget {
  final String gambar;
  final Color colors;

  Halamandua({required this.gambar, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: colors,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [colors, Colors.white, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Hero(
            tag: gambar,
            child: ClipOval(
              child: Image.asset(
                'img/$gambar',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Acara22PageState extends State<Acara22Page> {
  final List<String> gambar = [
    'chimmy.gif',
    'cooky.gif',
    'Koya.gif',
    'mang.gif',
    'rj.gif',
    'shooky.gif',
    'tata.gif',
    'van.gif',
  ];

  static const Map<String, Color> colors = {
    'chimmy.gif': Color(0xFFFFB569),
    'cooky.gif': Color(0xFFFF836B),
    'Koya.gif': Color(0xFF45CAF5),
    'mang.gif': Color(0xFFB19CD9),
    'rj.gif': Color(0xFFFFE5A8),
    'shooky.gif': Color(0xFF4C4C4C),
    'tata.gif': Color(0xFFFFA0B5),
    'van.gif': Color(0xFFBDE4E9),
  };

  double timeDilation = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACARA 22 - Gradient & PageView"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [Colors.white, Colors.purple, Colors.deepPurple],
          ),
        ),
        child: PageView.builder(
          itemCount: gambar.length,
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 50.0),
              child: Material(
                elevation: 8.0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Halamandua(
                          gambar: gambar[i],
                          colors: colors[gambar[i]]!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: colors[gambar[i]],
                    child: Image.asset(
                      'img/${gambar[i]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
