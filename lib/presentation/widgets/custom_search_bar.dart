import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final double? paddingValue;
  const CustomSearchBar({super.key, this.paddingValue});

  @override
  CustomBarState createState() => CustomBarState();
}

class CustomBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(widget.paddingValue ?? 0.0),
      child: SearchBar(
        leading: const Icon(Icons.search),
        hintText: 'Search',
        textStyle: WidgetStatePropertyAll(const TextStyle(color: Colors.black87)),
        hintStyle: WidgetStatePropertyAll(const TextStyle(color: Colors.black87)),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shadowColor: WidgetStatePropertyAll(Color.fromRGBO(38, 159, 255, .50)),
        elevation: WidgetStatePropertyAll(12.0),
      ),
    );
  }
}
