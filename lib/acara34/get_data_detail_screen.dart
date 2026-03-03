import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDataDetailScreen extends StatefulWidget {
  final int userId;

  const GetDataDetailScreen({Key? key, required this.userId})
      : super(key: key);

  @override
  State<GetDataDetailScreen> createState() =>
      _GetDataDetailScreenState();
}

class _GetDataDetailScreenState
    extends State<GetDataDetailScreen> {

  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getDetailUser();
  }

  Future<void> getDetailUser() async {
    var response = await http.get(
      Uri.parse(
          "https://reqres.in/api/users/${widget.userId}"),
      headers: {
        "Accept": "application/json",
        "x-api-key": "reqres_396b33afc3d241428fa7863bbda80b19"
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      setState(() {
        userData = data["data"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail User"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userData == null
          ? const Center(child: Text("Data tidak ditemukan"))
          : Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage:
              NetworkImage(userData!["avatar"]),
            ),
            const SizedBox(height: 20),
            Text(
              "${userData!["first_name"]} ${userData!["last_name"]}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userData!["email"],
              style:
              const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}