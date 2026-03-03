import 'package:flutter/material.dart';

class Acara17Page extends StatefulWidget {
  @override
  _Acara17PageState createState() => _Acara17PageState();
}

class _Acara17PageState extends State<Acara17Page> {

  // posisi lingkaran
  double redTop = -100;
  double pinkTop = -100;
  double blueTop = -100;

  double redLeft = 0;
  double pinkLeft = 0;
  double blueLeft = 0;

  @override
  void initState() {
    super.initState();

    animasi();
  }

  animasi() async {

    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      redTop = 20;
    });

    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      pinkTop = 80;
    });

    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      blueTop = 140;
    });

    await Future.delayed(Duration(milliseconds: 800));

    setState(() {
      redLeft = 150;
      pinkLeft = 210;
      blueLeft = 90;

      redTop = 200;
      pinkTop = 200;
      blueTop = 200;
    });

  }

  Widget lingkaran(Color warna) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: warna,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Belajar MaterialApp Scaffold"),
        backgroundColor: Colors.pinkAccent,
      ),

      body: Stack(
        children: [

          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: redTop,
            left: redLeft,
            child: lingkaran(Colors.red),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: pinkTop,
            left: pinkLeft,
            child: lingkaran(Colors.pink),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: blueTop,
            left: blueLeft,
            child: lingkaran(Colors.blue),
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add),
        onPressed: animasi,
      ),

    );
  }
}