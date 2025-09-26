import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/widgets/manager/mobile_deletion_dialog.dart';

import '../../../../data/service/product_service.dart';

class MobileProductDeletion extends StatefulWidget {
  const MobileProductDeletion({super.key});

  @override
  State<MobileProductDeletion> createState() => _MobileProductDeletionState();
}

class _MobileProductDeletionState extends State<MobileProductDeletion> {
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

      _products.clear();

      for (var item in response.cast<Map<String, dynamic>>()) {
        setState(() {
          _products.add(item);
        });
      }

      print("Products loaded: ${_products.length}");
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  Future<void> confirmDeletion(int index) async {
  showDialog(
      context: context,
      builder: (context) => MobileDeletionDialog(
        onTap: () async {
          final productId = _products[index]['id'];
          try {
            await _productService.deleteProduct(productId);

            if (mounted) {
              setState(() {
                _products.removeAt(index);
              });
            }

            Navigator.of(context).pop(true);
          } catch (e) {
            print("Error deleting product: $e");
            Navigator.of(context).pop(false);
          }
        },
        label: _products[index]['name'],
      ),
    );
  }

  List<Widget> buildOptionBullets(Map<String, dynamic> product) {
    List<String> options = [];

    if (product['hasSugarOption']) options.add("Sugar");
    if (product['hasIceOption']) options.add("Ice");
    if (product['hasCupSizeOption']) options.add("Cup Size");

    return options
        .map(
          (option) => Row(
            children: [
              const Text("• ", style: TextStyle(fontSize: 16)),
              Text(option),
            ],
          ),
        )
        .toList();
  }

  Widget buildProductCard(Map<String, dynamic> product, int index) {
    bool hasOptions =
        (product['hasSugarOption'] == true ||
        product['hasIceOption'] == true ||
        product['hasCupSizeOption'] == true);

    bool showOptionsSection = product['category'] != "Food" && hasOptions;

    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Category: ${product['category']}"),
            Text("Price: \$${product['price']}"),
            Text("Allergen: ${product['allergen']}"),
            const SizedBox(height: 5),

            if (showOptionsSection) ...[
              const Text(
                "Options Enabled:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              ...buildOptionBullets(product),
            ],

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () => confirmDeletion(index),
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Delete Product",
          style: TextStyle(color: Colors.grey[50], fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return buildProductCard(_products[index], index);
        },
      ),
    );
  }
}
