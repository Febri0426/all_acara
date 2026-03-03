import 'package:flutter/material.dart';

class Acara15Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// APPBAR
      appBar: AppBar(
        title: Text("Acara 15 - Core Widgets"),
        backgroundColor: Colors.blue,
      ),

      /// FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TEXT WIDGET
              Text(
                "Contoh Widget Text",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 20),

              /// ICON WIDGET
              Text(
                "Contoh Widget Icon (Row):",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    children: [
                      Icon(Icons.access_alarm,
                          color: Colors.red,
                          size: 50),
                      Text("Alarm")
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.phone,
                          color: Colors.green,
                          size: 50),
                      Text("Phone")
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.book,
                          color: Colors.blue,
                          size: 50),
                      Text("Book")
                    ],
                  ),

                ],
              ),

              SizedBox(height: 30),

              /// CONTAINER WIDGET
              Text(
                "Contoh Widget Container:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Haiii, Aku ada di dalam Container!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              /// BUTTON WIDGET
              Text(
                "Contoh Widget Button:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: Text("Elevated Button"),
              ),

              SizedBox(height: 10),

              MaterialButton(
                color: Colors.lime,
                height: 50,
                minWidth: double.infinity,
                onPressed: () {},
                child: Text("Material Button"),
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () {},
                child: Text(
                  "Text Button",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
              ),

              SizedBox(height: 30),

              /// TEXTFORMFIELD
              Text(
                "Contoh TextFormField (Login):",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: Text("Login"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
