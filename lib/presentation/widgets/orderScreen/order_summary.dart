import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummary extends StatelessWidget {
  final double subtotal;
  final double tax;
  final double discount;

  const OrderSummary({
    super.key,
    required this.subtotal,
    this.tax = 0,
    this.discount = 0,
  });

  double get total => subtotal + tax - discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 6,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow("Subtotal", "₱${subtotal.toStringAsFixed(2)}"),
          const SizedBox(height: 6),
          _buildRow("Tax", "₱${tax.toStringAsFixed(2)}"),
          const SizedBox(height: 6),
          _buildRow("Discount", "-₱${discount.toStringAsFixed(2)}",
              valueColor: Colors.red),
          const Divider(height: 20, thickness: 1),
          _buildRow(
            "Total",
            "₱${total.toStringAsFixed(2)}",
            isBold: true,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.green.shade600,
              ),
              onPressed: () {

              },
              child: Text(
                "Confirm Order",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value,
      {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
