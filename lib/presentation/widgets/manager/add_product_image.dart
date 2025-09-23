import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductImage extends StatefulWidget {
  const AddProductImage({super.key});

  @override
  AddProductImageState createState() => AddProductImageState();
}

class AddProductImageState extends State<AddProductImage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  File? get selectedFile => _imageFile;

  void clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Product Image"),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: _imageFile != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                _imageFile!,
                fit: BoxFit.cover,
              ),
            )
                : const Center(
              child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
