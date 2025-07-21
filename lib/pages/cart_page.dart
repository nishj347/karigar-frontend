
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
final List<Map<String, String>> cartItems;
final Function(int index) onRemoveItem;

const CartPage({
super.key,
required this.cartItems,
required this.onRemoveItem,
});

@override
State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
int _parsePrice(String price) {
final numeric = price.replaceAll(RegExp(r'[^0-9]'), '');
return int.tryParse(numeric) ?? 0;
}

int get totalPrice =>
widget.cartItems.fold(0, (sum, item) => sum + _parsePrice(item['price'] ?? ''));

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Your Cart"),
backgroundColor: Colors.deepOrange,
),
body: widget.cartItems.isEmpty
? const Center(child: Text("Your cart is empty"))
    : Column(
children: [
Expanded(
child: ListView.builder(
itemCount: widget.cartItems.length,
itemBuilder: (context, index) {
final item = widget.cartItems[index];
return ListTile(
leading: const Icon(Icons.miscellaneous_services),
title: Text(item['title'] ?? ''),
subtitle: Text(item['location'] ?? ''),
trailing: Row(
mainAxisSize: MainAxisSize.min,
children: [
Text(item['price'] ?? ''),
IconButton(
icon: const Icon(Icons.delete, color: Colors.red),
onPressed: () {
setState(() {
widget.onRemoveItem(index);
});
},
),
],
),
);
},
),
),
Container(
padding: const EdgeInsets.all(16),
width: double.infinity,
color: Colors.orange.shade50,
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text(
'Total:',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
Text(
'₹$totalPrice',
style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
],
),
)
],
),
);
}
}