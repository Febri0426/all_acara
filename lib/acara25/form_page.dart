import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {

  @override
  _FormPageState createState() => _FormPageState();

}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Tambahan variabel
  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("ACARA 25 - Form Flutter"),
      ),

      body: Form(

        key: _formKey,

        child: SingleChildScrollView(

          child: Padding(

            padding: EdgeInsets.all(20),

            child: Column(

              children: [

                // TEXTFIELD NAMA
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    controller: namaController,

                    decoration: InputDecoration(

                      labelText: "Nama",
                      hintText: "Masukkan Nama",

                      icon: Icon(Icons.person),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),

                    ),

                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "Nama tidak boleh kosong";

                      }

                      return null;

                    },

                  ),
                ),


                // TEXTFIELD PASSWORD
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    controller: passwordController,

                    obscureText: true,

                    decoration: InputDecoration(

                      labelText: "Password",

                      icon: Icon(Icons.security),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),

                    ),

                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "Password tidak boleh kosong";

                      }

                      return null;

                    },

                  ),
                ),


                // CHECKBOX
                CheckboxListTile(

                  title: Text("Belajar Dasar Flutter"),

                  subtitle: Text("Dart, Widget, HTTP"),

                  value: nilaiCheckBox,

                  activeColor: Colors.deepPurpleAccent,

                  onChanged: (value){

                    setState(() {

                      nilaiCheckBox = value!;

                    });

                  },

                ),


                // SWITCH
                SwitchListTile(

                  title: Text("Backend Programming"),

                  subtitle: Text("Dart, Nodejs, PHP, Java, dll"),

                  value: nilaiSwitch,

                  activeTrackColor: Colors.pink[100],

                  activeColor: Colors.red,

                  onChanged: (value){

                    setState(() {

                      nilaiSwitch = value;

                    });

                  },

                ),


                // SLIDER
                Slider(

                  value: nilaiSlider,

                  min: 0,

                  max: 100,

                  divisions: 100,

                  label: nilaiSlider.toString(),

                  onChanged: (value){

                    setState(() {

                      nilaiSlider = value;

                    });

                  },

                ),


                SizedBox(height: 20),


                // BUTTON
                ElevatedButton(

                  child: Text("Submit"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: (){

                    if(_formKey.currentState!.validate()){

                      ScaffoldMessenger.of(context).showSnackBar(

                        SnackBar(

                          content: Text(

                            "Halo ${namaController.text}\n"
                                "Password: ${passwordController.text}\n"
                                "Checkbox: $nilaiCheckBox\n"
                                "Switch: $nilaiSwitch\n"
                                "Slider: ${nilaiSlider.toStringAsFixed(0)}",

                          ),

                        ),

                      );

                    }

                  },

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}