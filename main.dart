import 'package:flutter/material.dart';
import 'models/movie.dart';
import 'screens/discover_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/watchlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Global İzleme Listemiz (State Güncelleme Simülasyonu)
  final List<Movie> watchlist = [];

  // Listeye ekleme veya listeden çıkarma fonksiyonu
  void toggleWatchlist(Movie movie) {
    setState(() {
      if (watchlist.contains(movie)) {
        watchlist.remove(movie);
      } else {
        watchlist.add(movie);
      }
    });
  }

  // Listeyi tamamen temizleme (Senkronizasyon sonrası)
  void clearWatchlist() {
    setState(() {
      watchlist.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineArchive Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F14),
        primaryColor: const Color(0xFFFFB800),
      ),
      // İsimlendirilmiş Sayfa Geçişleri (Named Routes)
      initialRoute: '/',
      routes: {
        '/': (context) => DiscoverMovieScreen(watchlist: watchlist),
        '/detail': (context) => MovieDetailScreen(watchlist: watchlist, onToggle: toggleWatchlist),
        '/watchlist': (context) => WatchlistScreen(watchlist: watchlist, onRemove: toggleWatchlist, onClear: clearWatchlist),
      },
    );
  }
}

// Projede harici veritabanı paketi yasak olduğu için simüle edilmiş JSON listesi
final List<Map<String, dynamic>> dummyMovieJsonData = [
  {
    "id": "1",
    "title": "Interstellar",
    "description": "Bir grup astronot, insanlığın hayatta kalmasını güvence altına almak için uzayda yeni bir yurt arayışına çıkar. Solucan deliklerinin ötesine geçen bu yolculuk zaman ve mekân sınırlarını zorlar.",
    "rating": 8.7,
    "imageUrl": "https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500",
    "genres": ["Bilim Kurgu", "Macera", "Dram"],
    "duration": "169 dk",
    "releaseYear": "2014"
  },
  {
    "id": "2",
    "title": "Inception",
    "description": "İnsanların rüyalarına girerek bilinçaltındaki en derin sırları çalan bir hırsızın, bu sefer bir fikri çalmak yerine zihne yeni bir fikir ekleme görevini üstlenmesi anlatılır.",
    "rating": 8.8,
    "imageUrl": "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=500",
    "genres": ["Aksiyon", "Bilim Kurgu"],
    "duration": "148 dk",
    "releaseYear": "2010"
  },
  {
    "id": "3",
    "title": "The Dark Knight",
    "description": "Batman, Gotham şehrini büyük bir kaosa sürüklemeye çalışan ve adaleti hiçe sayan anarşist suç dehası Joker'e karşı kariyerinin en ağır mücadelesini vermek zorunda kalır.",
    "rating": 9.0,
    "imageUrl": "https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=500",
    "genres": ["Aksiyon", "Suç", "Dram"],
    "duration": "152 dk",
    "releaseYear": "2008"
  },
  {
    "id": "4",
    "title": "Whiplash",
    "description": "Sadece en iyisi olmak isteyen acımasız ve dahi bir caz orkestrası şefi ile onun sınırlarını fiziksel ve psikolojik olarak sonuna kadar zorlayan genç, hırslı bir davulcunun gerilim dolu hikayesi.",
    "rating": 8.5,
    "imageUrl": "https://images.unsplash.com/photo-1511192336575-5a79af67a629?w=500",
    "genres": ["Dram", "Müzik"],
    "duration": "106 dk",
    "releaseYear": "2014"
  }
];