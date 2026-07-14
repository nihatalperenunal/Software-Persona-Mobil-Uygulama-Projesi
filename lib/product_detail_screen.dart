import 'package:flutter/material.dart';
import 'product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, iconTheme: const IconThemeData(color: Colors.cyanAccent)),
      body: Column(children: [
        Image.network(product.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
        Padding(padding: const EdgeInsets.all(20.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(product.name, style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
          Text(product.price, style: const TextStyle(fontSize: 24, color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(product.description, style: const TextStyle(color: Colors.white70, fontSize: 16))
        ])),
        const Spacer(),
        Padding(padding: const EdgeInsets.all(20.0), child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent, minimumSize: const Size(double.infinity, 55)),
          onPressed: () {
            bool found = false;
            for (var item in cartItems) { if (item.product.name == product.name) { item.quantity++; found = true; break; } }
            if (!found) cartItems.add(CartItem(product: product));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ürün sepete eklendi!")));
          },
          child: const Text("SEPETE EKLE", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))
      ]),
    );
  }
}