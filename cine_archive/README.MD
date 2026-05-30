# CineArchive - Film & Dizi Arşiv Kataloğu

Bu proje, 5 günlük yoğun bir Flutter eğitimi kapsamında temel mobil uygulama geliştirme süreçlerini ve yapı taşlarını öğrenmek amacıyla geliştirilmiş özgün bir sinema kütüphanesi ve katalog uygulaması taslağıdır.

## 🚀 Proje Kazanımları ve Çıktıları
- **Klasör Yapısı:** Sorumlulukların ayrılması (Separation of Concerns) prensibine uygun temiz proje mimarisi.
- **Widget Ağacı & UI:** Dark Mode teması üzerine kurulu `GridView`, `Card`, `ListTile`, `Hero` animasyonları ve `Chip` bileşenlerinin etkin kullanımı.
- **Navigasyon:** Sayfalar arası `Named Routes` ile geçiş ve `Route Arguments` ile dinamik veri transferi.
- **Veri Modelleme:** Sahte JSON film verilerinin `fromJson` metotları ile nesne tabanlı modele dönüştürülmesi.
- **State Yönetimi Simülasyonu:** `setState` yapısı kullanılarak "İzleme Listesi" ekleme/çıkarma durumunun anlık güncellenmesi.

## 🛠️ Kullanılan Teknolojiler
- **Flutter Sürümü:** 3.41.9 (Stabl e Channel)
- **Dart Sürümü:** 3.11.5
- **Geliştirme Ortamı:** Visual Studio Code
- **Paketler:** Sadece yerleşik `material.dart` paketi kullanılmış, harici bir kütüphaneye ihtiyaç duyulmamıştır.

## 📁 Proje Klasör Yapısı
```text
lib/
├── models/
│   └── movie.dart            # Film/Dizi veri modeli ve JSON haritalama
├── screens/
│   ├── discover_screen.dart  # Keşfet ekranı ve dinamik GridView listeleme
│   ├── detail_screen.dart    # Film özet, puan ve detayları ekranı
│   └── watchlist_screen.dart # İzleme listesi görünümü ve senkronizasyon simülasyonu
└── main.dart                 # Uygulama başlangıcı ve Route rotaları




⚙️ Projeyi Çalıştırma Adımları
Bu projeyi yerel bilgisayarınızda sorunsuz bir şekilde ayağa kaldırmak için aşağıdaki adımları sırasıyla takip edebilirsiniz:

Ön Gereksinimler
Bilgisayarınızda Flutter SDK (v3.41.9 veya üzeri) kurulu olmalıdır.

Aktif bir emülatör/simülatör (Android/iOS) veya tarayıcı/masaüstü çalışma ortamı hazır olmalıdır.

1. Projeyi Klonlayın
Öncelikle projeyi GitHub üzerinden bilgisayarınıza indirin ve proje klasörünün içine girin:

Bash
git clone https://github.com/aycatapaN/cinarchive-flutter.git
cd cinarchive-flutter
2. Bağımlılıkları Yükleyin
Proje dizinindeyken gerekli temel paket yapılandırmasını tamamlamak için terminalde şu komutu çalıştırın:

Bash
flutter pub get
3. Cihazınızı Kontrol Edin
Uygulamayı test edeceğiniz bağlı cihazların veya aktif emülatörlerin listelendiğinden emin olun:

Bash
flutter devices
4. Uygulamayı Başlatın
Her şey hazırsa, uygulamayı test ortamınızda çalıştırmak için aşağıdaki komutu kullanabilirsiniz:

Bash
flutter run
💡 VS Code Kullanıcıları İçin İpucu:
Geliştirme ortamı olarak Visual Studio Code kullanıyorsanız, projeyi açtıktan sonra lib/main.dart dosyasına gidip klavyeden F5 tuşuna basarak uygulamayı hata ayıklama (Debug) modunda doğrudan başlatabilirsiniz.
