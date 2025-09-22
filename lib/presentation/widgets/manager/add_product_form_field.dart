import 'package:flutter/material.dart';

class AddProductFormField extends StatefulWidget {
  final String label;
  final bool isPrice;
  final TextEditingController controller;
  final bool isOptional;

  const AddProductFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.isPrice,
    this.isOptional = false,
  });

  @override
  State<AddProductFormField> createState() => _AddProductFormFieldState();
}

class _AddProductFormFieldState extends State<AddProductFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType:
      widget.isPrice ? TextInputType.number : TextInputType.text,
      cursorColor: Colors.blueAccent,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
      validator: (value) {
        if (widget.isOptional && (value == null || value.isEmpty)) {
          return null;
        }
        if (value == null || value.isEmpty) {
          return widget.isPrice
              ? "Price is required"
              : "This field is required";
        }
        if (widget.isPrice && double.tryParse(value) == null) {
          return "Please enter a valid number";
        }
        return null;
      },
    );
  }
}
