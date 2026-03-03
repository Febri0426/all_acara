import 'package:flutter/material.dart';
import 'package:all_acara/acara35//data/api_provider.dart'; // Mengambil data API
import 'package:all_acara/acara35//model/popular_movies.dart'; // Mengambil model data

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  ApiProvider apiProvider = ApiProvider();
  late Future<PopularMovies> popularMovies;

  @override
  void initState() {
    super.initState();
    // Memulai proses pengambilan data saat halaman dibuka
    popularMovies = apiProvider.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: FutureBuilder<PopularMovies>(
        future: popularMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Jika data berhasil diambil
            return ListView.builder(
              itemCount: snapshot.data?.results?.length ?? 0,
              itemBuilder: (context, index) {
                var movie = snapshot.data!.results![index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: movie.posterPath != null
                        ? Image.network(
                      'https://image.tmdb.org/t/p/w185${movie.posterPath}',
                      width: 50,
                      fit: BoxFit.cover,
                      // Jika gambar gagal dimuat dari internet
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                    )
                        : const Icon(Icons.movie),
                    title: Text(
                      movie.title ?? "No Title",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      movie.overview ?? "No Overview",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // Jika terjadi error saat mengambil data
            return Center(
              child: Text(
                'Terjadi Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          // Saat sedang proses loading (menunggu data)
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}