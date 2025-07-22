import 'package:flutter/material.dart';

class PainterSubcategoryPage extends StatelessWidget {
  final void Function(Map<String, String>) onAddToCart;
  final List<Map<String, String>> currentCart;
  final void Function(int) onRemoveItem;

  PainterSubcategoryPage({
    required this.onAddToCart,
    required this.currentCart,
    required this.onRemoveItem,
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Wall Painting',
      'price': '₹700',
      'rating': '4.5',
      'image': 'assets/painter1.jpg',
    },
    {
      'title': 'Ceiling Design',
      'price': '₹1000',
      'rating': '4.7',
      'image': 'assets/painter2.jpg',
    },
    {
      'title': 'Exterior Painting',
      'price': '₹1500',
      'rating': '4.6',
      'image': 'assets/painter3.jpg',
    },
    {
      'title': 'Furniture Painting',
      'price': '₹400',
      'rating': '4.3',
      'image': 'assets/painter4.jpg',
    },
    {
      'title': 'Textured Wall',
      'price': '₹1200',
      'rating': '4.8',
      'image': 'assets/painter5.jpg',
    },
  ];

  void _showServiceDetails(BuildContext context, Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(service['image'], height: 150, fit: BoxFit.cover),
              ),
              const SizedBox(height: 12),
              Text(service['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(service['price'], style: const TextStyle(fontSize: 16, color: Colors.green)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(service['rating'], style: const TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 12),
              const Text("• Professional painter service\n• Neat and clean finish\n• Materials not included"),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  onAddToCart({
                    'title': service['title'],
                    'price': service['price'],
                  });
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD7A00),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter Services'),
        backgroundColor: const Color(0xFFFD7A00),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3.6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = services[index];
            return GestureDetector(
              onTap: () => _showServiceDetails(context, item),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        item['image'],
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(item['price'], style: const TextStyle(color: Colors.green)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star, size: 16, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text(item['rating'], style: const TextStyle(fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFFD7A00),
                              radius: 14,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.add, color: Colors.white, size: 16),
                                onPressed: () {
                                  onAddToCart({
                                    'title': item['title'],
                                    'price': item['price'],
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
