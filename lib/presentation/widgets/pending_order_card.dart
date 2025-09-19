import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'order_details_dialog.dart';

class PendingOrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onComplete;
  final VoidCallback onCancel;

  const PendingOrderCard({
    super.key,
    required this.order,
    required this.onComplete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(55),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order #${order['orderId']}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Chip(
                  label: Text(
                    order['status'],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Customer: ${order['customer']}",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Text(
              "Ordered Items:",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (order['items'] as List<String>)
                  .map(
                    (item) => Text(
                      "• $item",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[800],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "₱${(order['total'] as num).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => OrderDetailsDialog(
                        order: order,
                        onCancel: onCancel,
                        onComplete: onComplete,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    size: 18,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Details",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                  ),
                  onPressed: onComplete,
                  icon: const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Complete",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
