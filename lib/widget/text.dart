import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextMain extends StatelessWidget {
  final String text;
  final double size;
  TextMain(this.text, this.size);

  @override
  Widget build(BuildContext context) {
    return (Text(
      this.text,
      style: GoogleFonts.poppins(
        fontSize: this.size,
        fontWeight: FontWeight.w700,
      ),
    ));
  }
}

class TextActive extends StatelessWidget {
  final String text;
  final double size;
  TextActive(this.text, this.size);

  @override
  Widget build(BuildContext context) {
    return (Text(
      this.text,
      style: GoogleFonts.poppins(
        fontSize: this.size,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.left,
    ));
  }
}

class TextMainNormal extends StatelessWidget {
  final String text;
  final double size;
  TextMainNormal(this.text, this.size);

  @override
  Widget build(BuildContext context) {
    return (Text(
      this.text,
      style: GoogleFonts.poppins(
        fontSize: this.size,
      ),
    ));
  }
}
