import 'package:flutter/material.dart';
import 'package:karigar/pages/cart_page.dart';

void showAddedToCartSnackbar(BuildContext context, List<Map<String, String>> cartItems, Function(int) onRemoveItem) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFFB4311A),
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 3),
      content: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartPage(
                cartItems: cartItems,
                onRemoveItem: onRemoveItem,
              ),
            ),
          );
        },
        child: Row(
          children: const [
            Icon(Icons.shopping_cart, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text("Item added to cart", style: TextStyle(color: Colors.white)),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    ),
  );
}
