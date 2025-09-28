import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/widgets/manager/add_product_image.dart';

import '../../../../widgets/manager/options_toggle.dart';

class UpdateProductDialog extends StatefulWidget {
  final Map<String, dynamic> product;

  const UpdateProductDialog({super.key, required this.product});

  @override
  State<UpdateProductDialog> createState() => _UpdateProductDialogState();
}

class _UpdateProductDialogState extends State<UpdateProductDialog> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController allergenController;

  bool cupSizeEnabled = false;
  bool iceEnabled = false;
  bool sugarEnabled = false;

  final GlobalKey<AddProductImageState> imageKey =
      GlobalKey<AddProductImageState>();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final product = widget.product;
    nameController = TextEditingController(text: product['name']);
    priceController = TextEditingController(text: product['price'].toString());
    allergenController = TextEditingController(text: product['allergen']);

    cupSizeEnabled = product['hasCupSizeOption'] ?? false;
    iceEnabled = product['hasIceOption'] ?? false;
    sugarEnabled = product['hasSugarOption'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        "Update Product",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 2.5),
                  TextFormField(
                    controller: nameController,
                    cursorColor: Colors.blueAccent,
                    decoration: InputDecoration(
                      labelText: "Food Name",
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter food name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: priceController,
                    cursorColor: Colors.blueAccent,
                    decoration: InputDecoration(
                      labelText: "Price",
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter price";
                      }
                      if (double.tryParse(value) == null) {
                        return "Enter a valid number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: allergenController,
                    cursorColor: Colors.blueAccent,
                    decoration: InputDecoration(
                      labelText: "Allergen (Optional)",
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (product['category'] == 'BEVERAGE') ...[
                    const Text(
                      'Options Enabled:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    OptionsToggle(
                      label: "Show Cup Sizes",
                      value: cupSizeEnabled,
                      onToggled: (isOn) =>
                          setState(() => cupSizeEnabled = isOn),
                    ),
                    OptionsToggle(
                      label: "Show Ice Options",
                      value: iceEnabled,
                      onToggled: (isOn) => setState(() => iceEnabled = isOn),
                    ),
                    OptionsToggle(
                      label: "Show Sugar Level",
                      value: sugarEnabled,
                      onToggled: (isOn) => setState(() => sugarEnabled = isOn),
                    ),
                  ],

                  AddProductImage(key: imageKey),
                ],
              ),
            ),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context, null),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("Save"),
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              final updatedProduct = {
                ...product,
                'name': nameController.text,
                'price': double.tryParse(priceController.text) ?? 0,
                'allergen': allergenController.text,
                'hasCupSizeOption': product['category'] == 'BEVERAGE'
                    ? cupSizeEnabled
                    : false,
                'hasIceOption': product['category'] == 'BEVERAGE'
                    ? iceEnabled
                    : false,
                'hasSugarOption': product['category'] == 'BEVERAGE'
                    ? sugarEnabled
                    : false,
                'imageFile': imageKey.currentState?.selectedFile,
              };
              Navigator.pop(context, updatedProduct);
            }
          },
        ),
      ],
    );
  }
}
