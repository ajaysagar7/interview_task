import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String textValue;
  final double textSize;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomText({
    Key? key,
    required this.textValue,
    required this.textSize,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: true,
      textValue,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
