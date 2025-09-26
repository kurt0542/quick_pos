import 'package:flutter/material.dart';
class MobileDeletionDialog extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const MobileDeletionDialog({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      elevation: 10,
      title: Row(
        children: const [
          Icon(Icons.delete_forever, color: Colors.red),
          SizedBox(width: 10),
          Text(
            "Confirm Deletion",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        "Are you sure you want to delete '$label'?",
        style: const TextStyle(fontSize: 16),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[700],
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Cancel", style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          onPressed: () => onTap(),
          child: const Text("Delete", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
