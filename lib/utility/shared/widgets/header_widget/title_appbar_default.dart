import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAppBarDefault extends StatelessWidget {
  final String labelTitle;
  const TitleAppBarDefault({
    Key? key,
    required this.labelTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      labelTitle,
      style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1),
    );
  }
}
