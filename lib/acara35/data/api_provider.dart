import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:all_acara/acara35//model/popular_movies.dart';

class ApiProvider {
  String apiKey = '988e3471cc47c5625a22de6148b31115'; // Jangan sampai kosong!
  String baseUrl = 'https://api.themoviedb.org/3';
  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat data film');
    }
  }
}