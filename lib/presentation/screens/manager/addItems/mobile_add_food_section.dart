import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_pos/presentation/widgets/primary_button.dart';

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

  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
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
                labelText: "Possible Allergens",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: _pickImage,
              child: _imageFile == null
                  ? Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text("Tap to select an image"),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _imageFile!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(text: 'Add as Food', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
