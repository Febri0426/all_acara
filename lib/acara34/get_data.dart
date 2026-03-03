import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_data_detail_screen.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({Key? key}) : super(key: key);

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  final String url = "https://reqres.in/api/users?page=2";

  List<dynamic> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  Future<void> getJsonData() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "x-api-key": "reqres_396b33afc3d241428fa7863bbda80b19"
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var convertDataToJson = jsonDecode(response.body);

      setState(() {
        data = convertDataToJson["data"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refresh() async {
    await getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar User (Acara 34)"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:
                NetworkImage(data[index]["avatar"]),
              ),
              title: Text(
                "${data[index]["first_name"]} ${data[index]["last_name"]}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                data[index]["email"],
                style: const TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GetDataDetailScreen(
                      userId: data[index]["id"],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}