import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/widgets/custom_search_bar.dart';
import 'package:quick_pos/presentation/widgets/menu_category_chip.dart';
import 'package:quick_pos/presentation/widgets/mobile_order_tile.dart';

class CashierMobileOrderScreen extends StatefulWidget {
  const CashierMobileOrderScreen({super.key});

  @override
  State<CashierMobileOrderScreen> createState() =>
      _CashierMobileOrderScreenState();
}

class _CashierMobileOrderScreenState extends State<CashierMobileOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomSearchBar(paddingValue: 15),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MenuCategoryChip(label: "Food"),
                MenuCategoryChip(label: "Beverages"),
              ],
            ),
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.2,
              children: [
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
                MobileOrderTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
