import 'package:flutter/material.dart';

class Movie {
  final String id;
  final String title;
  final String description;
  final double rating;
  final String imageUrl;
  final List<String> genres;
  final String duration;
  final String releaseYear;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.genres,
    required this.duration,
    required this.releaseYear,
  });

  // Gelen ham veriyi (JSON) haritalayan zorunlu metot
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      duration: json['duration'] ?? '120 dk',
      releaseYear: json['releaseYear'] ?? '2024',
    );
  }
}