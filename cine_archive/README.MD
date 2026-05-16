# CineArchive - Film & Dizi Arşiv Kataloğu

[cite_start]Bu proje, 5 günlük yoğun bir Flutter eğitimi kapsamında temel mobil uygulama geliştirme süreçlerini ve yapı taşlarını öğrenmek amacıyla geliştirilmiş özgün bir sinema kütüphanesi ve katalog uygulaması taslağıdır[cite: 3, 4].

## 🚀 Proje Kazanımları ve Çıktıları
- [cite_start]**Klasör Yapısı:** Sorumlulukların ayrılması (Separation of Concerns) prensibine uygun temiz proje mimarisi[cite: 5, 107].
- [cite_start]**Widget Ağacı & UI:** Dark Mode teması üzerine kurulu `GridView`, `Card`, `ListTile`, `Hero` animasyonları ve `Chip` bileşenlerinin etkin kullanımı[cite: 5, 29, 31, 46].
- [cite_start]**Navigasyon:** Sayfalar arası `Named Routes` ile geçiş ve `Route Arguments` ile dinamik veri transferi[cite: 5, 35, 36, 103, 104].
- [cite_start]**Veri Modelleme:** Sahte JSON film verilerinin `fromJson` metotları ile nesne tabanlı modele dönüştürülmesi[cite: 5, 38, 39].
- [cite_start]**State Yönetimi Simülasyonu:** `setState` yapısı kullanılarak "İzleme Listesi" ekleme/çıkarma durumunun anlık güncellenmesi[cite: 48, 106].

## [cite_start]🛠️ Kullanılan Teknolojiler [cite: 8]
- [cite_start]**Flutter Sürümü:** 3.41.9 (Stable Channel) [cite: 9, 124]
- [cite_start]**Dart Sürümü:** 3.11.5 [cite: 10]
- [cite_start]**Geliştirme Ortamı:** Visual Studio Code [cite: 11]
- [cite_start]**Paketler:** Sadece yerleşik `material.dart` paketi kullanılmış, harici bir kütüphaneye ihtiyaç duyulmamıştır[cite: 15, 16].

## [cite_start]📁 Proje Klasör Yapısı [cite: 5, 107]
```text
lib/
├── models/
│   └── movie.dart            # Film/Dizi veri modeli ve JSON haritalama [cite: 38]
├── screens/
│   ├── discover_screen.dart  # Keşfet ekranı ve dinamik GridView listeleme [cite: 45, 46]
│   ├── detail_screen.dart    # Film özet, puan ve detayları ekranı [cite: 47]
│   └── watchlist_screen.dart # İzleme listesi görünümü ve senkronizasyon simülasyonu [cite: 48]
└── main.dart                 # Uygulama başlangıcı ve Route rotaları [cite: 22, 35]