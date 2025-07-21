import 'package:flutter/material.dart';
import 'package:karigar/widgets/cart_snackbar.dart';

class ElectricianSubcategoryPage extends StatelessWidget {
  final void Function(Map<String, String>) onAddToCart;
  final List<Map<String, String>> currentCart;
  final void Function(int) onRemoveItem;

  const ElectricianSubcategoryPage({
    super.key,
    required this.onAddToCart,
    required this.currentCart,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
      {'title': 'Light Fitting', 'price': '₹200'},
      {'title': 'Fan Repair', 'price': '₹250'},
      {'title': 'AC Wiring', 'price': '₹500'},
      {'title': 'House Wiring', 'price': '₹1500'},
      {'title': 'Inverter Installation', 'price': '₹800'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrician Services'),
        backgroundColor: Colors.deepOrange,
        actions: const [
          Icon(Icons.notifications), // 🛎️ Bell icon
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final item = services[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.electrical_services),
              title: Text(item['title']!),
              subtitle: Text('Estimated: ${item['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  onAddToCart(item);
                  showAddedToCartSnackbar(context, currentCart, onRemoveItem);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD7A00),
                ),
                child: const Text("Add"),
              ),
            ),
          );
        },
      ),
    );
  }
}
