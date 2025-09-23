import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/widgets/manager/add_product_image.dart';
import 'package:quick_pos/presentation/widgets/primary_button.dart';

import '../../../../data/service/product_service.dart';

class MobileAddFoodSection extends StatefulWidget {
  const MobileAddFoodSection({super.key});

  @override
  State<MobileAddFoodSection> createState() => _MobileAddFoodSectionState();

}

class _MobileAddFoodSectionState extends State<MobileAddFoodSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _allergensController = TextEditingController();
  final GlobalKey<AddProductImageState> _imageKey = GlobalKey<AddProductImageState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              cursorColor: Colors.blueAccent,
              decoration: InputDecoration(
                labelText: "Food Name",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter food name";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.blueAccent,
              decoration: InputDecoration(
                labelText: "Price",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter price";
                }
                if (double.tryParse(value) == null) {
                  return "Please enter a valid number";
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _allergensController,
              cursorColor: Colors.blueAccent,
              decoration: InputDecoration(
                labelText: "Possible Allergens (optional)",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AddProductImage(key: _imageKey,),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Add Food',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    final imageFile = _imageKey.currentState?.selectedFile;

                    final productService = ProductService();
                    await productService.add(
                      category: "FOOD",
                      name: _nameController.text,
                      price: double.parse(_priceController.text),
                      imageFile: imageFile,
                      allergen: _allergensController.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Product added successfully!")),
                    );

                    _formKey.currentState!.reset();
                    _nameController.clear();
                    _priceController.clear();
                    _allergensController.clear();

                    _imageKey.currentState?.clearImage();

                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to add product: $e")),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
