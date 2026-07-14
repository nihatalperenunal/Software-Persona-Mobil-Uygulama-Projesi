# 🛍️ Mini Katalog Uygulaması

Bu proje, Flutter çerçevesi (framework) kullanarak geliştirdiğim, temel e-ticaret dinamiklerini (ürün listeleme, detay görüntüleme ve sepet yönetimi) barındıran bir mini katalog mobil uygulama taslağıdır. Projeyi Flutter widget'ları ve Dart dili mimarisi kullanarak inşa ettim.

## ✨ Öne Çıkan Özellikler

* **Katalog Görünümü:** Ürünlerin `GridView` kullanılarak modern ve esnek bir arayüzle listelenmesi.
* **Gerçek Zamanlı Arama:** Kullanıcıların arama çubuğu üzerinden ürün isimlerine göre anlık filtreleme yapabilmesi.
* **Dinamik Sepet Yönetimi:** * Ürünlerin detay sayfasından sepete eklenebilmesi.
  * Aynı ürün tekrar eklendiğinde liste kirliliği yaratmadan mevcut adetin (quantity) artırılması.
  * Sepet içerisinde `+` ve `-` butonlarıyla stok/adet kontrolü yapılması.
  * Toplam sepet tutarının dinamik ve anlık olarak hesaplanması.
  * Sepet boş olduğunda kullanıcıya özel uyarı ekranı (Empty State) gösterilmesi.
* **Sayfa İçi Yönlendirme:** `Navigator` yapısı ile sayfalar arası kesintisiz geçiş ve veri (Route Arguments) taşıma.

## 🛠️ Kullanılan Teknolojiler Ve Sürüm Bilgileri

* **Flutter SDK:** 3.44.6 (Channel stable)
* **Dart SDK:** 3.12.2
* **State Management:** `StatefulWidget` ve `setState` (Temel durum yönetimi)
* **Veri Kaynağı:** Proje içi Mock Data (Model sınıfları üzerinden simüle edilmiş veri yönetimi)

## 📂 Proje Mimari Yapısı

Proje kodları; okunabilirliği artırmak ve bakımı kolaylaştırmak adına modüler bir yapıda kurgulanmıştır:

* `lib/product_model.dart`: Ürün (`Product`) ve sepet (`CartItem`) veri modellerinin, aynı zamanda uygulamada kullanılan yerel verilerin tutulduğu merkez dosya.
* `lib/home_screen.dart`: Uygulama ana sayfası; banner alanı, arama mantığı (search query) ve ürün grid listesini barındırır.
* `lib/product_detail_screen.dart`: Ürünlerin detaylı görsel, fiyat ve açıklamalarının yer aldığı, sepete ekleme aksiyonunun (iş işleyiş mantığı) tetiklendiği sayfa.
* `lib/cart_screen.dart`: Sepet içeriğinin listelendiği, ürün adetlerinin güncellendiği ve genel toplam ödeme tutarının yönetildiği kontrol sayfası.

## 🚀 Kurulum ve Çalıştırma

Projeyi yerel ortamınızda test etmek için aşağıdaki adımları izleyebilirsiniz:

1. Bu depoyu bilgisayarınıza klonlayın:
   ```bash
   git clone [https://github.com/KULLANICI_ADIN/mini_katalog_app.git](https://github.com/KULLANICI_ADIN/mini_katalog_app.git)
2. Terminal üzerinden proje klasörüne gidin:
   ```bash
   cd mini_katalog_app
   ```
3. Gerekli Flutter bağımlılıklarını (paketleri) yüklemek için şu komutu çalıştırın:
   ```bash
   flutter pub get
   ```
4. Uygulamayı aktif bir emülatörde veya bağlı cihazınızda başlatın:
   ```bash
   flutter run
   ```
