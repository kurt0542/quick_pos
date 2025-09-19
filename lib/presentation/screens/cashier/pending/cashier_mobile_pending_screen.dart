import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/widgets/pending_order_card.dart';

class CashierMobilePendingScreen extends StatefulWidget {
  const CashierMobilePendingScreen({super.key});

  @override
  State<CashierMobilePendingScreen> createState() =>
      _CashierMobilePendingScreenState();
}

class _CashierMobilePendingScreenState
    extends State<CashierMobilePendingScreen> {
  List<Map<String, dynamic>> pendingOrders = [
    {
      "orderId": "ORD-1001",
      "customer": "John Doe",
      "items": ["Burger", "Fries", "Coke"],
      "total": 250.00,
      "status": "Pending",
    },
    {
      "orderId": "ORD-1002",
      "customer": "Jane Smith",
      "items": ["Pizza", "Iced Tea"],
      "total": 300.00,
      "status": "Pending",
    },
    {
      "orderId": "ORD-1003",
      "customer": "Mark Lee",
      "items": ["Pasta", "Garlic Bread"],
      "total": 280.00,
      "status": "Pending",
    },
  ];

  void _removeOrder(int index, {required bool completed}) {
    final order = pendingOrders[index];
    setState(() {
      pendingOrders.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          completed
              ? "Order ${order['orderId']} marked complete"
              : "Order ${order['orderId']} cancelled",
        ),
        backgroundColor: completed ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(
          "Pending Orders",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 2,
      ),
      body: pendingOrders.isEmpty
          ? Center(
        child: Text(
          "No pending orders",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pendingOrders.length,
        itemBuilder: (context, index) {
          final order = pendingOrders[index];
          return PendingOrderCard(
            order: order,
            onComplete: () => _removeOrder(index, completed: true),
            onCancel: () => _removeOrder(index, completed: false),
          );
        },
      ),
    );
  }
}
