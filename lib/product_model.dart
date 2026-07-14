class Product {
  final String name;
  final String price;
  final String imageUrl;
  final String description;

  Product({required this.name, required this.price, required this.imageUrl, required this.description});
}

// Sepetteki her bir satırı temsil eden sınıf
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

final List<Product> catalogItems = [
  Product(name: "Pro PC Gamepad", price: "₺2.499", imageUrl: "https://images.unsplash.com/photo-1600080972464-8e5f35f63d08?w=500&q=80", description: "Hassas analoglar ve ergonomik yapı."),
  Product(name: "Neon Mekanik Klavye", price: "₺3.150", imageUrl: "https://images.unsplash.com/photo-1595225476474-87563907a212?w=500&q=80", description: "RGB aydınlatmalı mekanik tuşlar."),
  Product(name: "RGB Oyuncu Mouse", price: "₺1.200", imageUrl: "https://images.pexels.com/photos/2115256/pexels-photo-2115256.jpeg?auto=compress&cs=tinysrgb&h=500", description: "Yüksek DPI ayarlarıyla tam kontrol."),
  Product(name: "7.1 Gaming Kulaklık", price: "₺2.850", imageUrl: "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500&q=80", description: "Surround ses teknolojisi."),
];

List<CartItem> cartItems = [];