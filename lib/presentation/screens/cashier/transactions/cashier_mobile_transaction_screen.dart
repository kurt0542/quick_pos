import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/mini_pending_order_card.dart';
import 'transaction_card.dart';

class CashierMobileTransactionScreen extends StatefulWidget {
  const CashierMobileTransactionScreen({super.key});

  @override
  State<CashierMobileTransactionScreen> createState() =>
      _CashierMobileTransactionScreenState();
}

class _CashierMobileTransactionScreenState
    extends State<CashierMobileTransactionScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      "orderNumber": "#ORD-1001",
      "customerName": "John Doe",
      "items": ["Burger", "Fries", "Coke"],
    },
    {
      "orderNumber": "#ORD-1002",
      "customerName": "Jane Smith",
      "items": ["Pizza", "Salad"],
    },
    {
      "orderNumber": "#ORD-1003",
      "customerName": "Alice Johnson",
      "items": ["Pasta", "Garlic Bread", "Water"],
    },
  ];

  double getSubtotal(List items) => items.length * 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pending Orders",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[50],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.grey[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final order = transactions[index];
                      return MiniPendingOrderCard(order: order);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Completed Transactions",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        return TransactionCard(
                          transaction: transaction,
                          subtotal: getSubtotal(transaction["items"]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}