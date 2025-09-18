import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isDineIn = true;

  @override
  Widget build(BuildContext context) {
    double toggleWidth = MediaQuery.of(context).size.width / 2 - 20;

    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: isDineIn ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: toggleWidth,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => setState(() => isDineIn = true),
                  child: Center(
                    child: Text(
                      "Dine In",
                      style: GoogleFonts.roboto(
                        fontWeight: isDineIn ? FontWeight.bold : FontWeight.w400,
                        fontSize: 16,
                        color: isDineIn ? Colors.blue[800] : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => setState(() => isDineIn = false),
                  child: Center(
                    child: Text(
                      "Take Away",
                      style: GoogleFonts.roboto(
                        fontWeight: !isDineIn ? FontWeight.bold : FontWeight.w400,
                        fontSize: 16,
                        color: !isDineIn ? Colors.blue[800] : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
