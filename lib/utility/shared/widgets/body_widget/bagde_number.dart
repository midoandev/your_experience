import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_experience/utility/shared/constants/string_helper.dart';

import '../../shared.dart';

class BadgeNumber extends StatelessWidget {
  final int number;
  final Color? colorsText;
  final Color? colorsBackground;

  const BadgeNumber(
      {Key? key, required this.number, this.colorsText, this.colorsBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: number > 0,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorsBackground ?? '#1D74F5'.hexToColor),
        child: Center(
          child: Text(number > 99 ? '+99' : number.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: colorsText ?? Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 10)),
        ),
      ),
    );
  }
}
