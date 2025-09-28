import 'package:flutter/material.dart';

import '../../data/service/product_service.dart';
import '../screens/cashier/orders/mobile_order_screen.dart';

class MobileOrderTile extends StatefulWidget {
  final String name;
  final double price;
  final int itemSold;
  final String imagePath;
  final int id;

  const MobileOrderTile({
    super.key,
    required this.name,
    required this.price,
    required this.itemSold,
    required this.imagePath,
    required this.id,
  });

  @override
  State<MobileOrderTile> createState() => _MobileOrderTileState();
}

class _MobileOrderTileState extends State<MobileOrderTile> {
  late String imageRequestPath;
  final ProductService _productService = ProductService();
  Map<String, dynamic>? _product;

  @override
  void initState() {
    super.initState();
    imageRequestPath = 'http://192.168.100.21:8080${widget.imagePath}';
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final response = await _productService.getProductById(widget.id);

      setState(() {
        _product = response;
      });
    } catch (e) {
      print("Error fetching product: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MobileOrderScreen(
              productTitle: _product!["name"] ?? "No Name",
              price: (_product!["price"] ?? 0).toDouble(),
              allergen: _product!["allergen"] ?? "",
              imagePath: imageRequestPath,
              cupSizeOption: _product!["hasCupSizeOption"],
              iceOption: _product!["hasIceOption"],
              sugarOption: _product!["hasSugarOption"],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
               child: Image.network(
                  imageRequestPath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey[600],
                        size: 40,
                      ),
                    );
                  },
                )

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₱${widget.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "products sold: ${widget.itemSold}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
