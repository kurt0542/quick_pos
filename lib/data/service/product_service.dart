import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductClass {
  final String baseUrl = "http://192.168.100.21:8080";

  Future<Map<String, dynamic>> add({
    required String category,
    required String name,
    required double price,
    String? imageUrl,
    String? allergen,
    int? salesCount,
  }) async {
    final url = Uri.parse('$baseUrl/products/add');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "category": category,
        "name": name,
        "price": price,
        "imageUrl": imageUrl ?? "",
        "allergen": allergen ?? "",
        "salesCount": salesCount ?? 0,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Adding Product Failed: ${response.body}");
    }
  }
}
