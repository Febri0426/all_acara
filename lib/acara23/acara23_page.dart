import 'package:flutter/material.dart';

class Acara23Page extends StatefulWidget {

  final String gambar;
  final Color colors;

  Acara23Page({
    this.gambar = "foto.jpg",
    this.colors = Colors.purple,
  });

  @override
  _Acara23PageState createState() => _Acara23PageState();
}


// CLASS PILIHAN
class Pilihan {

  const Pilihan({
    required this.teks,
    required this.warna,
  });

  final String teks;
  final Color warna;

}



class _Acara23PageState extends State<Acara23Page> {


  Color warna = Colors.grey;


// LIST PILIHAN

  List<Pilihan> listPilihan = const <Pilihan>[

    Pilihan(teks: "Red", warna: Colors.red),

    Pilihan(teks: "Green", warna: Colors.green),

    Pilihan(teks: "Blue", warna: Colors.blue),

  ];



  void _pilihannya(Pilihan pilihan){

    setState(() {

      warna = pilihan.warna;

    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: Text("ACARA 23"),

        backgroundColor: Colors.purple,


        actions: [

          PopupMenuButton<Pilihan>(

            onSelected: _pilihannya,

            itemBuilder: (BuildContext context){

              return listPilihan.map((Pilihan x){

                return PopupMenuItem<Pilihan>(

                  value: x,

                  child: Text(x.teks),

                );

              }).toList();

            },

          )

        ],

      ),



      body: Stack(

        children: [


          // GRADIENT BACKGROUND

          Container(

            decoration: BoxDecoration(

              gradient: RadialGradient(

                center: Alignment.center,

                colors: [

                  Colors.purple,

                  warna,

                  Colors.deepPurple,

                ],

              ),

            ),

          ),



          // HERO IMAGE

          Center(

            child: Hero(

              tag: widget.gambar,

              child: ClipOval(

                child: SizedBox(

                  width: 200,

                  height: 200,

                  child: Material(

                    child: InkWell(

                      onTap: (){

                        Navigator.pop(context);

                      },

                      child: Image.asset(

                        "assets/image/${widget.gambar}",

                        fit: BoxFit.cover,

                      ),

                    ),

                  ),

                ),

              ),

            ),

          ),


        ],

      ),


    );

  }

}
