import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../main.dart'; // Sahte veriye erişmek için

class DiscoverMovieScreen extends StatefulWidget {
  final List<Movie> watchlist;
  const DiscoverMovieScreen({super.key, required this.watchlist});

  @override
  State<DiscoverMovieScreen> createState() => _DiscoverMovieScreenState();
}

class _DiscoverMovieScreenState extends State<DiscoverMovieScreen> {
  List<Movie> allMovies = [];
  List<Movie> displayedMovies = [];
  String selectedCategory = "Hepsi";
  final List<String> categories = ["Hepsi", "Aksiyon", "Bilim Kurgu", "Dram", "Macera"];

  @override
  void initState() {
    super.initState();
    allMovies = dummyMovieJsonData.map((json) => Movie.fromJson(json)).toList();
    displayedMovies = allMovies;
  }

  // Arama ve Kategori Filtreleme Mantığı
  void filterMovies(String query, String category) {
    setState(() {
      displayedMovies = allMovies.where((movie) {
        final matchesSearch = movie.title.toLowerCase().contains(query.toLowerCase());
        final matchesCategory = category == "Hepsi" || movie.genres.contains(category);
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineArchive', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline_rounded, size: 28),
            onPressed: () => Navigator.pushNamed(context, '/watchlist').then((_) => setState(() {})),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Arama Çubuğu
            TextField(
              onChanged: (value) => filterMovies(value, selectedCategory),
              decoration: InputDecoration(
                hintText: 'Film veya tür ara...',
                prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFFFFB800)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                filled: true,
                fillColor: const Color(0xFF181824),
              ),
            ),
            const SizedBox(height: 12),
            // Kategori Çipleri (Chips)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: selectedCategory == cat,
                      selectedColor: const Color(0xFFFFB800),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategory = cat;
                          filterMovies("", selectedCategory);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Izgara (Grid) Görünümü ile Filmleri Listeleme
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: displayedMovies.length,
                itemBuilder: (context, index) {
                  final movie = displayedMovies[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail', arguments: movie).then((_) => setState(() {})),
                    child: Container(
                      decoration: BoxDecoration(color: const Color(0xFF181824), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Hero(
                              tag: 'movie-pic-${movie.id}',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  image: DecorationImage(image: NetworkImage(movie.imageUrl), fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}