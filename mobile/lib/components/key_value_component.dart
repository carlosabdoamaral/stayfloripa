import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyValueComponent extends StatefulWidget {
  const KeyValueComponent({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  State<KeyValueComponent> createState() => _KeyValueComponentState();
}

class _KeyValueComponentState extends State<KeyValueComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
