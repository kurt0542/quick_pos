import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerInformation extends StatefulWidget {
  const CustomerInformation({super.key});

  @override
  State<CustomerInformation> createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _tableFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _tableFocus.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.grey.shade600,
      ),
      prefixIcon: Icon(icon, color: Colors.grey.shade700),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 48,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Information",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

          TextField(
            focusNode: _nameFocus,
            textCapitalization: TextCapitalization.words,
            autocorrect: false,
            decoration: _inputDecoration(
              hint: "Enter customer name",
              icon: Icons.person_outline,
            ),
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textInputAction: TextInputAction.next,
          ),

          const SizedBox(height: 15),

          TextField(
            focusNode: _tableFocus,
            keyboardType: TextInputType.number,
            decoration: _inputDecoration(
              hint: "Enter table number",
              icon: Icons.table_restaurant_outlined,
            ),
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
