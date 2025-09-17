import 'package:flutter/material.dart';

class OrderCustomizationSelection extends StatefulWidget {
  final String title;
  final List<String> options;
  final int? defaultIndex;
  const OrderCustomizationSelection({
    super.key,
    required this.title,
    required this.options,
    this.defaultIndex
  });

  @override
  State<OrderCustomizationSelection> createState() =>
      _OrderCustomizationSelectionState();
}

class _OrderCustomizationSelectionState
    extends State<OrderCustomizationSelection> {


  @override
  Widget build(BuildContext context) {
    int? _selectedIndex = widget.defaultIndex;
    final options = widget.options;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(options.length, (index) {
            return ChoiceChip(
              label: Text(options[index], style: TextStyle(fontSize: 18)),
              selected: _selectedIndex == index,
              onSelected: (_) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedColor: Colors.blue,
              labelStyle: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black,
              ),
              showCheckmark: false,
              padding: options.length > 3
                  ? EdgeInsets.symmetric(horizontal: 11, vertical: 10) :
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            );
          }),
        ),
      ],
    );
  }
}
