import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ProductService {
  final String baseUrl = "http://192.168.100.21:8080";

  Future<Map<String, dynamic>> add({
    required String category,
    required String name,
    required double price,
    File? imageFile,
    String? allergen,
    bool? hasSugarOption = false,
    bool? hasIceOption = false,
    bool? hasCupSizeOption = false,
  }) async {
    final uri = Uri.parse('$baseUrl/products/add');
    final request = http.MultipartRequest('POST', uri);

    final productJson = jsonEncode({
      "category": category,
      "name": name,
      "price": price,
      "allergen": allergen ?? "",
      "hasSugarOption": hasSugarOption,
      "hasIceOption": hasIceOption,
      "hasCupSizeOption": hasCupSizeOption,
    });

    request.fields['product'] = productJson;

    if (imageFile != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          filename: basename(imageFile.path),
        ),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Adding Product Failed: ${response.body}");
    }
  }

  Future<List<dynamic>> getAllProducts() async {
    final uri = Uri.parse('$baseUrl/products/getAllProducts');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception("Failed to fetch products: ${response.body}");
    }
  }
}