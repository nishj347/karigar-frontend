import 'package:flutter/material.dart';

class ManageAddressPage extends StatefulWidget {
  const ManageAddressPage({super.key});

  @override
  State<ManageAddressPage> createState() => _ManageAddressPageState();
}

class _ManageAddressPageState extends State<ManageAddressPage> {
  List<Map<String, String>> addresses = [
    {
      'label': 'Home',
      'details': '123 MG Road, Indore, Madhya Pradesh',
    },
    {
      'label': 'Work',
      'details': '456 Office Lane, Bhopal, Madhya Pradesh',
    },
  ];

  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  void _editAddress(int index) {
    // Navigate to edit_address_page.dart (to be created next)
    // You can pass address details if needed
    Navigator.pushNamed(context, '/edit-address');
  }

  void _addNewAddress() {
    Navigator.pushNamed(context, '/add-address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Addresses"),
        backgroundColor: const Color(0xFFFD7A00),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.location_on, color: Color(0xFFB4311A)),
              title: Text(
                address['label'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(address['details'] ?? ''),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') _editAddress(index);
                  if (value == 'delete') _deleteAddress(index);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewAddress,
        backgroundColor: const Color(0xFFFD7A00),
        icon: const Icon(Icons.add_location_alt, color: Colors.white),
        label: const Text(
          "Add Address",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
