import 'package:flutter/material.dart';

class MobileOrderTile extends StatefulWidget {
  const MobileOrderTile({super.key});

  @override
  State<MobileOrderTile> createState() => _MobileOrderTileState();
}

class _MobileOrderTileState extends State<MobileOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
