import 'package:flutter/material.dart';
import 'product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get total => cartItems.fold(0, (sum, item) => sum + (double.parse(item.product.price.replaceAll(RegExp(r'[^\d]'), '')) * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("SEPETİM", style: TextStyle(color: Colors.cyanAccent)), backgroundColor: Colors.black, iconTheme: const IconThemeData(color: Colors.cyanAccent)),
      body: cartItems.isEmpty ? const Center(child: Text("Sepetiniz boş.", style: TextStyle(color: Colors.white54))) : ListView.builder(itemCount: cartItems.length, itemBuilder: (context, index) {
        final item = cartItems[index];
        return ListTile(
          leading: Image.network(item.product.imageUrl, width: 50),
          title: Text(item.product.name, style: const TextStyle(color: Colors.white)),
          subtitle: Row(children: [
            Text(item.product.price, style: const TextStyle(color: Colors.cyanAccent)),
            IconButton(icon: const Icon(Icons.remove, size: 16, color: Colors.white), onPressed: () => setState(() { if(item.quantity > 1) item.quantity--; })),
            Text("${item.quantity}", style: const TextStyle(color: Colors.white)),
            IconButton(icon: const Icon(Icons.add, size: 16, color: Colors.white), onPressed: () => setState(() => item.quantity++))
          ]),
          trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () => setState(() => cartItems.removeAt(index))),
        );
      }),
      bottomNavigationBar: cartItems.isEmpty ? null : Container(padding: const EdgeInsets.all(20), color: Colors.grey.shade900, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("TOPLAM", style: TextStyle(color: Colors.white, fontSize: 18)), Text("₺${total.toStringAsFixed(0)}", style: const TextStyle(color: Colors.cyanAccent, fontSize: 20, fontWeight: FontWeight.bold))])),
    );
  }
}