
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
final List<Map<String, String>> orders;
final void Function(int index)? onRemoveOrder;

const OrdersPage({
Key? key,
required this.orders,
this.onRemoveOrder,
}) : super(key: key);

@override
State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
void _removeOrder(int index) {
widget.onRemoveOrder?.call(index);
setState(() {}); // Just update UI
}

void _checkout() {
showDialog(
context: context,
builder: (_) => AlertDialog(
title: const Text("Checkout Successful"),
content: const Text("Your orders have been placed!"),
actions: [
TextButton(
onPressed: () {
Navigator.pop(context);
setState(() {
widget.orders.clear();
});
},
child: const Text("OK"),
),
],
),
);
}

@override
Widget build(BuildContext context) {
final orders = widget.orders;

return Scaffold(
backgroundColor: Colors.transparent,
appBar: AppBar(
title: const Text('My Orders'),
backgroundColor: Colors.transparent,
elevation: 0,
flexibleSpace: Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
colors: [Color(0xFFC71C23), Color(0xFFD4AF37)],
begin: Alignment.bottomLeft,
end: Alignment.topRight,
),
),
),
),
body: Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
colors: [Color(0xFFC71C23), Color(0xFFD4AF37)],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
),
),
child: orders.isEmpty
? const Center(
child: Text(
'No orders placed yet.',
style: TextStyle(fontSize: 18, color: Colors.white70),
),
)
    : Column(
children: [
Expanded(
child: ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: orders.length,
itemBuilder: (context, index) {
final order = orders[index];
return Container(
margin: const EdgeInsets.only(bottom: 16),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.85),
borderRadius: BorderRadius.circular(16),
boxShadow: const [
BoxShadow(
color: Colors.black26,
blurRadius: 6,
offset: Offset(0, 4),
),
],
),
child: ListTile(
contentPadding: const EdgeInsets.all(16),
leading: const Icon(Icons.assignment_turned_in,
color: Colors.deepPurple, size: 36),
title: Text(
order['title'] ?? '',
style: const TextStyle(
fontWeight: FontWeight.bold, fontSize: 16),
),
subtitle: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox(height: 4),
Text('📍 ${order['location'] ?? ''}'),
Text('💰 ${order['price'] ?? ''}'),
],
),
trailing: IconButton(
icon: const Icon(Icons.delete, color: Colors.red),
onPressed: () => _removeOrder(index),
),
),
);
},
),
),
if (orders.isNotEmpty)
Padding(
padding: const EdgeInsets.all(16),
child: SizedBox(
width: 180,
height: 42,
child: ElevatedButton.icon(
onPressed: _checkout,
icon: const Icon(Icons.payment, size: 18),
label: const Text('Checkout'),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white70,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30),
),
textStyle: const TextStyle(fontSize: 14),
),
),
),
),
],
),
),
);
}
}