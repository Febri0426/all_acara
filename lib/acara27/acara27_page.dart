import 'package:flutter/material.dart';

class Acara27Page extends StatefulWidget {
  @override
  _Acara27PageState createState() => _Acara27PageState();
}

class _Acara27PageState extends State<Acara27Page> {
  List<String> agama = ["Islam", "Kristen Protestan", "Kristen Katolik", "Hindu", "Budha"];
  String _agama = "Islam";
  String _jk = "";

  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerMoto = TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimdata() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Moto Hidup : ${controllerMoto.text}"),
            Text("Jenis Kelamin : $_jk"),
            Text("Agama : $_agama"),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Data diri"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "Moto Hidup",
                      labelText: "Moto Hidup",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                RadioListTile(
                  value: "Laki-laki",
                  title: Text("Laki-Laki"),
                  groupValue: _jk,
                  onChanged: (String? value) => _pilihJk(value!),
                  activeColor: Colors.blue,
                  subtitle: Text("Pilih ini jika anda Laki-laki"),
                ),
                RadioListTile(
                  value: "Perempuan",
                  title: Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String? value) => _pilihJk(value!),
                  activeColor: Colors.blue,
                  subtitle: Text("Pilih ini jika anda perempuan"),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Row(
                  children: <Widget>[
                    Text("Agama ", style: TextStyle(fontSize: 18.0, color: Colors.blue)),
                    Padding(padding: EdgeInsets.only(left: 15.0)),
                    DropdownButton<String>(
                      onChanged: (String? value) => pilihAgama(value!),
                      value: _agama,
                      items: agama.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () => kirimdata(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}