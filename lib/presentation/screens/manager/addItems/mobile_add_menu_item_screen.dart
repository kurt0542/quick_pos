import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/screens/manager/addItems/mobile_add_food_section.dart';
import 'package:quick_pos/presentation/widgets/toggle_button.dart';

class MobileAddMenuItemScreen extends StatefulWidget {
  const MobileAddMenuItemScreen({super.key});

  @override
  State<MobileAddMenuItemScreen> createState() =>
      _MobileAddMenuItemScreenState();
}

class _MobileAddMenuItemScreenState extends State<MobileAddMenuItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Product",
          style: TextStyle(
            color: Colors.grey[50],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ToggleButton(leftLabel: 'Food', rightLabel: 'Beverage'),
            Expanded(
              child: MobileAddFoodSection(),
            ),
          ],
        ),
      ),
    );
  }
}
