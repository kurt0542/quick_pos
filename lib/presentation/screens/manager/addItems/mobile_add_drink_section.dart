import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/widgets/manager/add_product_image.dart';
import 'package:quick_pos/presentation/widgets/manager/options_toggle.dart';
import 'package:quick_pos/presentation/widgets/primary_button.dart';
import '../../../../data/service/product_service.dart';

class MobileAddDrinkSection extends StatefulWidget {
  const MobileAddDrinkSection({super.key});

  @override
  State<MobileAddDrinkSection> createState() => _MobileAddDrinkSectionState();
}

class _MobileAddDrinkSectionState extends State<MobileAddDrinkSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _allergenController = TextEditingController();
  final GlobalKey<AddProductImageState> _imageKey =
  GlobalKey<AddProductImageState>();

  bool _cupSizeEnabled = false;
  bool _iceEnabled = false;
  bool _sugarEnabled = false;

  void _addDrinkToMenu() async {
    if (_formKey.currentState!.validate()) {
      try {
        final imageFile = _imageKey.currentState?.selectedFile;

        final productService = ProductService();
        await productService.add(
          category: "BEVERAGE",
          name: _nameController.text,
          price: double.parse(_priceController.text),
          imageFile: imageFile,
          allergen:
          _allergenController.text.isEmpty ? null : _allergenController.text,
          hasCupSizeOption: _cupSizeEnabled,
          hasIceOption: _iceEnabled,
          hasSugarOption: _sugarEnabled,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Beverage added successfully!")),
        );

        _formKey.currentState!.reset();
        _nameController.clear();
        _priceController.clear();
        _allergenController.clear();
        _imageKey.currentState?.clearImage();

        setState(() {
          _cupSizeEnabled = false;
          _iceEnabled = false;
          _sugarEnabled = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add drink: $e")),
        );
      }
    }
  }

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
              decoration: const InputDecoration(
                labelText: "Beverage Name",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter beverage name";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.blueAccent,
              decoration: const InputDecoration(
                labelText: "Price",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(),
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
              controller: _allergenController,
              cursorColor: Colors.blueAccent,
              decoration: const InputDecoration(
                labelText: "Possible Allergens (optional)",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            OptionsToggle(
              label: "Show Cup Sizes",
              value: _cupSizeEnabled,
              onToggled: (isOn) {
                setState(() => _cupSizeEnabled = isOn);
              },
            ),
            OptionsToggle(
              label: "Show Ice Options",
              value: _iceEnabled,
              onToggled: (isOn) {
                setState(() => _iceEnabled = isOn);
              },
            ),
            OptionsToggle(
              label: "Show Sugar Level",
              value: _sugarEnabled,
              onToggled: (isOn) {
                setState(() => _sugarEnabled = isOn);
              },
            ),
            const SizedBox(height: 24),

            AddProductImage(key: _imageKey),
            const SizedBox(height: 30),

            PrimaryButton(
              text: 'Add Beverage',
              onPressed: _addDrinkToMenu,
            ),
          ],
        ),
      ),
    );
  }
}
