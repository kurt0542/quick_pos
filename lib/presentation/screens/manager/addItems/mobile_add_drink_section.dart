import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/widgets/manager/add_product_image.dart';
import 'package:quick_pos/presentation/widgets/manager/options_toggle.dart';
import 'package:quick_pos/presentation/widgets/manager/add_product_form_field.dart';
import '../../../widgets/primary_button.dart';

class MobileAddDrinkSection extends StatefulWidget {
  const MobileAddDrinkSection({super.key});

  @override
  State<MobileAddDrinkSection> createState() => _MobileAddDrinkSectionState();
}

class _MobileAddDrinkSectionState extends State<MobileAddDrinkSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _allergenController = TextEditingController();

  bool _cupSizeEnabled = false;
  bool _iceEnabled = false;
  bool _sugarEnabled = false;

  void _addDrinkToMenu() {
    final name = _nameController.text;
    final price = _priceController.text;
    final allergen = _allergenController.text.isEmpty
        ? null
        : _allergenController.text;

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddProductFormField(
            label: "Beverage Name",
            controller: _nameController,
            isPrice: false,
          ),
          const SizedBox(height: 16),

          AddProductFormField(
            label: "Price",
            controller: _priceController,
            isPrice: true,
          ),
          const SizedBox(height: 16),

          AddProductFormField(
            label: "Possible Allergens (optional)",
            controller: _allergenController,
            isPrice: false,
            isOptional: true,
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

          const AddProductImage(),
          const SizedBox(height: 30),

          PrimaryButton(
            text: 'Add Beverage',
            onPressed: _addDrinkToMenu,
          ),
        ],
      ),
    );
  }
}
