import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButton extends StatefulWidget {
  final String leftLabel;
  final String rightLabel;
  final Function(bool)? onToggle;

  const ToggleButton({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    this.onToggle,
  });

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isLeftSelected = true;

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
            alignment:
            isLeftSelected ? Alignment.centerLeft : Alignment.centerRight,
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
                  onTap: () {
                    setState(() => isLeftSelected = true);
                    if (widget.onToggle != null) widget.onToggle!(true);
                  },
                  child: Center(
                    child: Text(
                      widget.leftLabel,
                      style: GoogleFonts.roboto(
                        fontWeight: isLeftSelected
                            ? FontWeight.bold
                            : FontWeight.w400,
                        fontSize: 16,
                        color: isLeftSelected ? Colors.blue[800] : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() => isLeftSelected = false);
                    if (widget.onToggle != null) widget.onToggle!(false);
                  },
                  child: Center(
                    child: Text(
                      widget.rightLabel,
                      style: GoogleFonts.roboto(
                        fontWeight: !isLeftSelected
                            ? FontWeight.bold
                            : FontWeight.w400,
                        fontSize: 16,
                        color: !isLeftSelected ? Colors.blue[800] : Colors.black87,
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
