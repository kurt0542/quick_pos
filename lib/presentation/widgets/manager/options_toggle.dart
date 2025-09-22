import 'package:flutter/material.dart';

class OptionsToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onToggled;

  const OptionsToggle({
    super.key,
    required this.label,
    required this.value,
    required this.onToggled,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      value: value,
      activeColor: Colors.white,
      activeTrackColor: Colors.blueAccent,
      inactiveThumbColor: Colors.blueAccent,
      inactiveTrackColor: Colors.grey[300],
      onChanged: onToggled,
    );
  }
}
