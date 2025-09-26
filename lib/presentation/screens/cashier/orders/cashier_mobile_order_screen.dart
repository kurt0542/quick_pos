import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pos/presentation/widgets/custom_search_bar.dart';
import 'package:quick_pos/presentation/widgets/menu_category_chip.dart';
import 'package:quick_pos/presentation/widgets/mobile_order_tile.dart';

import '../../../../data/service/product_service.dart';

class CashierMobileOrderScreen extends StatefulWidget {
  const CashierMobileOrderScreen({super.key});

  @override
  State<CashierMobileOrderScreen> createState() =>
      _CashierMobileOrderScreenState();
}

class _CashierMobileOrderScreenState extends State<CashierMobileOrderScreen> {
  final ProductService _productService = ProductService();
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final response = await _productService.getAllProducts();

      setState(() {
        _products = response.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomSearchBar(paddingValue: 15),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                MenuCategoryChip(label: "Food"),
                MenuCategoryChip(label: "Beverages"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              'Menu',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: _products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
              controller: ScrollController(initialScrollOffset: 18),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.2,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return MobileOrderTile(
                  name: product["name"] ?? '',
                  price: (product["price"] as num).toDouble(),
                  itemSold: product["salesCount"] ?? 0,
                  imagePath: product["imageUrl"] ?? '',
                  id: product["id"],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
