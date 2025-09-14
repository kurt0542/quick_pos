import 'package:flutter/material.dart';

class MenuCategoryChip extends StatelessWidget {
  final String label;

  const MenuCategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.black26,
        child: ChoiceChip(
          label: Text(label),
          selected: false,
          selectedColor: Colors.lightBlue,
          labelStyle: TextStyle(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onSelected: (selected) {},
        ),
      ),
    );
  }
}
