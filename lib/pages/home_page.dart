import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:karigar/pages/cart_page.dart';
import 'package:karigar/pages/orders_page.dart';
import 'package:karigar/pages/subcategory/electrician_subcategory.dart';

const primaryColor = Color(0xFFFD7A00);
const backgroundColor = Color(0xFFFFF3E0);

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<Map<String, String>> cartItems = [];

  void _removeItemFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _addItemToCart(Map<String, String> item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void _navigateToSubcategory(String category) {
    if (category == "Electricians") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ElectricianSubcategoryPage(
            onAddToCart: _addItemToCart,
            currentCart: cartItems,
            onRemoveItem: _removeItemFromCart,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Karigar"),
        backgroundColor: primaryColor,
      ),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Text(
                  "Hello Guest!",
                  style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    Positioned(
                      left: 55,
                      top: 18,
                      child: SizedBox(
                        width: 220,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Search for services...',
                              textStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCategoryCard(Icons.handyman, "Carpenters"),
                    _buildCategoryCard(Icons.plumbing, "Plumbers"),
                    _buildCategoryCard(Icons.format_paint, "Painters"),
                    _buildCategoryCard(Icons.electrical_services, "Electricians"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "For You",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildServiceCard("Uttkarsh", "Amity company", "150 RS", "assets/user1.png"),
                    _buildServiceCard("Dhara", "Hostel company", "200 RS", "assets/user2.png"),
                    _buildServiceCard("Kartik", "Home company", "150 RS", "assets/user3.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            backgroundColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: 0,
            onTap: (index) {
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrdersPage(
                      orders: cartItems,
                      onRemoveOrder: _removeItemFromCart,
                    ),
                  ),
                );
              } else if (index == 3) {
                Navigator.pushNamed(context, '/profile');
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildCategoryCard(IconData icon, String title) {
    return GestureDetector(
      onTap: () => _navigateToSubcategory(title),
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: primaryColor),
            const SizedBox(height: 6),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String name, String company, String price, String imagePath) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 CHANGE IMAGE HERE
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(company, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(price, style: const TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
