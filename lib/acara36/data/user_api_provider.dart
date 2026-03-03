import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:all_acara/acara36//model/user_model.dart';

class UserApiProvider {
  Client client = Client();

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await client.get(
          Uri.parse("https://reqres.in/api/users?page=1"));

      if (response.statusCode == 200) {
        // Decode body JSON
        var jsonResponse = json.decode(response.body);

        // Ambil bagian list 'data' dari JSON
        List<dynamic> listData = jsonResponse['data'];

        // Ubah menjadi List of UserModel
        return listData.map((user) => UserModel.fromJson(user)).toList();
      } else {
        // Jika status code bukan 200 (misal 404 atau 500)
        throw Exception('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      // Jika ada kesalahan format atau masalah koneksi
      throw Exception('Error: $e');
    }
  }
}