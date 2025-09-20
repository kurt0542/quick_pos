import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/widgets/details_button.dart';

class MiniPendingOrderCard extends StatelessWidget {
  final Map<String, dynamic> order;

  const MiniPendingOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final int itemCount = order["items"].length;

    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order["orderNumber"],
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            order["customerName"],
            style: GoogleFonts.roboto(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            "Items: $itemCount",
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [DetailsButton()],
          ),
        ],
      ),
    );
  }
}
