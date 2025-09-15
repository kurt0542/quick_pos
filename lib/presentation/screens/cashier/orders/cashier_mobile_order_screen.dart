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
      backgroundColor: Colors.grey[100],
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
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Menu',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              controller:ScrollController(initialScrollOffset: 18),
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.2,
              children: [
                MobileOrderTile(
                  name: "Caramel Coffee Jelly Frappuccino",
                  price: 175,
                  stock: 23,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Mocha Frappuccino",
                  price: 160,
                  stock: 15,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Java Chip Frappuccino",
                  price: 180,
                  stock: 10,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Strawberries & Cream Frappuccino",
                  price: 185,
                  stock: 8,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Caramel Macchiato",
                  price: 170,
                  stock: 12,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Caffè Americano",
                  price: 140,
                  stock: 20,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Chocolate Muffin",
                  price: 95,
                  stock: 30,
                  imagePath: "",
                ),
                MobileOrderTile(
                  name: "Classic Cheesecake",
                  price: 215,
                  stock: 5,
                  imagePath: "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
