import 'package:flutter/material.dart';
import '../models/movie.dart';

class WatchlistScreen extends StatefulWidget {
  final List<Movie> watchlist;
  final Function(Movie) onRemove;
  final Function() onClear;

  const WatchlistScreen({super.key, required this.watchlist, required this.onRemove, required this.onClear});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İzleme Listem'), backgroundColor: Colors.transparent, elevation: 0),
      body: widget.watchlist.isEmpty
          ? const Center(child: Text('Listeniz şu an tamamen boş.', style: TextStyle(color: Colors.grey)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.watchlist.length,
                    itemBuilder: (context, index) {
                      final movie = widget.watchlist[index];
                      return Card(
                        color: const Color(0xFF181824),
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: ListTile(
                          leading: Image.network(movie.imageUrl, width: 40, height: 60, fit: BoxFit.cover),
                          title: Text(movie.title, style: const TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                            onPressed: () => setState(() => widget.onRemove(movie)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFB800)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF181824),
                            title: const Text('Başarılı'),
                            content: const Text('Listeniz bulut kütüphanenizle senkronize edildi!'),
                            actions: [
                              TextButton(onPressed: () { widget.onClear(); Navigator.pop(context); Navigator.pop(context); }, child: const Text('Kapat')),
                            ],
                          ),
                        );
                      },
                      child: const Text('Listeyi Senkronize Et', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}