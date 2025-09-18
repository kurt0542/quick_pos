import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/screens/cashier/orders/order_list.dart';
import 'package:quick_pos/presentation/widgets/orderScreen/customer_information.dart';
import 'package:quick_pos/presentation/widgets/orderScreen/order_summary.dart';
import 'package:quick_pos/presentation/widgets/toggle_button.dart';

class MobileOrderConfirmation extends StatefulWidget {
  const MobileOrderConfirmation({super.key});

  @override
  State<MobileOrderConfirmation> createState() =>
      _MobileOrderConfirmationState();
}

class _MobileOrderConfirmationState extends State<MobileOrderConfirmation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        children: [
          SizedBox(
            height: 55,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Order",
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(50),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, size: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ToggleButton(),
          CustomerInformation(),
          SizedBox(height: 350,child: OrderList()),
          OrderSummary(subtotal: 0, tax: 0, discount: 0,)
        ],
      ),
    );
  }
}
