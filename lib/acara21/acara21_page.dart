import 'package:flutter/material.dart';

class Acara21Page extends StatefulWidget {
  @override
  _Acara21PageState createState() => _Acara21PageState();
}

class _Acara21PageState extends State<Acara21Page> {
  PageController _pageController = PageController();
  String selectedValue = "Pilihan 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACARA 21 - Gradient, PageView, Dropdown"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              Colors.purpleAccent,
              Colors.deepPurple,
            ],
          ),
        ),
        child: PageView(
          controller: _pageController,
          children: [

            // ================= PAGE 1 =================
            Center(
              child: Text(
                "HALAMAN 1\nGRADIENT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ================= PAGE 2 =================
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HALAMAN 2\nDROPDOWN",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: "Pilihan 1",
                        child: Text("Pilihan 1"),
                      ),
                      DropdownMenuItem(
                        value: "Pilihan 2",
                        child: Text("Pilihan 2"),
                      ),
                      DropdownMenuItem(
                        value: "Pilihan 3",
                        child: Text("Pilihan 3"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            // ================= PAGE 3 =================
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HALAMAN 3\nPAGEVIEW BUTTON",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("⬅ Sebelumnya"),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("Selanjutnya ➡"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
