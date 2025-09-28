import 'package:flutter/material.dart';

import '../../../../../data/service/product_service.dart';
import 'mobile_update_product_dialog.dart';

class MobileManagerUpdateScreen extends StatefulWidget {
  const MobileManagerUpdateScreen({super.key});

  @override
  State<MobileManagerUpdateScreen> createState() =>
      _MobileManagerUpdateScreenState();
}

class _MobileManagerUpdateScreenState extends State<MobileManagerUpdateScreen> {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error loading products: $e"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> handleUpdate(int index) async {
    final product = _products[index];

    final updated = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => UpdateProductDialog(product: product),
    );

    if (updated != null) {
      setState(() {
        _products[index] = updated;
      });

      try {
        await _productService.updateProduct(
          id: updated['id'],
          name: updated['name'],
          price: updated['price'],
          allergen: updated['allergen'],
          hasCupSizeOption: updated['hasCupSizeOption'],
          hasIceOption: updated['hasIceOption'],
          hasSugarOption: updated['hasSugarOption'],
          imageFile: updated['imageFile'],
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Product updated successfully!"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error updating product: $e"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Update Product",
          style: TextStyle(color: Colors.grey[50], fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                product['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category: ${product['category']}"),
                  Text("Price: ₱${product['price'].toStringAsFixed(2)}"),
                  Text("Allergen: ${product['allergen']}"),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(
                      onPressed: () => handleUpdate(index),
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      label: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
