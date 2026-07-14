import 'package:flutter/material.dart';
import 'product_model.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> displayedList = catalogItems;

  void _runFilter(String keyword) {
    setState(() {
      displayedList = catalogItems
          .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('DISCOVER', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
        actions: [
          IconButton(
            icon: Stack(children: [
              const Icon(Icons.shopping_bag_outlined, color: Colors.cyanAccent),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Text('${cartItems.length}', style: const TextStyle(fontSize: 8, color: Colors.white)),
                  ),
                )
            ]),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())).then((_) => setState(() {})),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Arama Çubuğu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                onChanged: _runFilter,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(icon: Icon(Icons.search, color: Colors.cyanAccent), hintText: 'Ürün ara...', border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20),
            // Banner Alanı
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), gradient: const LinearGradient(colors: [Colors.cyanAccent, Colors.blueAccent])),
              child: const Center(child: Text("YENİ SEZON İNDİRİMİ!\n%50'YE VARAN AVANTAJLAR", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))),
            ),
            const SizedBox(height: 20),
            // Ürün Listesi
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.75),
                itemCount: displayedList.length,
                itemBuilder: (context, index) {
                  final product = displayedList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product))).then((_) => setState(() {})),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), child: Image.network(product.imageUrl, fit: BoxFit.cover))),
                          Padding(padding: const EdgeInsets.all(8.0), child: Text(product.name, style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis)),
                          Text(product.price, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}