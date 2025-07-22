
import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'manage_address_page.dart';
import '../home_page.dart';
import '../cart_page.dart';
import '../orders_page.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
      const primaryColor = Color(0xFFFD7A00);
      const backgroundColor = Color(0xFFFFF3E0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),

      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Profile picture and name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('/assets/user.png'), // 🔁 Change image here
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hello Guest!',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('+91 1234567890', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: primaryColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const EditProfilePage()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Menu options
          _buildTile(context, Icons.location_on, 'Manage Address',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ManageAddressPage()),
                );
              }),
          _buildTile(context, Icons.card_giftcard, 'Refer & Earn'),
          _buildTile(context, Icons.star_border, 'Rate Us'),
          _buildTile(context, Icons.info_outline, 'About Karigar Services'),
          _buildTile(context, Icons.logout, 'Logout'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePageWidget()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => CartPage(
                  cartItems: const [],
                  onRemoveItem: (item) {}, // dummy callback for now
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => OrdersPage(orders: const []),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title,
      {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: const Color(0xFFFD7A00)),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}