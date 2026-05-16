import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final List<Movie> watchlist;
  final Function(Movie) onToggle;
  const MovieDetailScreen({super.key, required this.watchlist, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    // Diğer sayfadan gelen veriyi yakaladığımız o meşhur satır (Arguments)
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final isAdded = watchlist.contains(movie);

    return Scaffold(
      body: Stack(
        children: [
          // Arka planı bulanıklaştıran havalı sinema efekti
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(movie.imageUrl), fit: BoxFit.cover)),
            child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), child: Container(color: Colors.black.withOpacity(0.7))),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(backgroundColor: Colors.transparent, elevation: 0),
                  Hero(
                    tag: 'movie-pic-${movie.id}',
                    child: Container(width: 200, height: 280, decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), image: DecorationImage(image: NetworkImage(movie.imageUrl), fit: BoxFit.cover))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Text(movie.description, style: const TextStyle(color: Colors.white70, height: 1.6)),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: isAdded ? Colors.red : const Color(0xFFFFB800)),
                            onPressed: () {
                              onToggle(movie);
                              Navigator.pop(context);
                            },
                            child: Text(isAdded ? 'Listemden Çıkar' : 'İzleme Listeme Ekle', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}