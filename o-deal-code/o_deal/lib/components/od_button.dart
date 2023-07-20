import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ODButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color titleColor;
  final Color buttonBackgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double titleFontSize;
  final Icon? leadingIcon;
  final Icon? suffixIcon;
  final Image? suffixIconImage;
  final Image? prefixIconImage;
  bool disabled;

  ODButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.titleColor,
    required this.buttonBackgroundColor,
    required this.borderColor,
    required this.borderRadius,
    required this.titleFontSize,
    this.leadingIcon,
    this.suffixIcon,
    this.suffixIconImage,
    this.prefixIconImage,
    required this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled ? null : onTap,
      style: TextButton.styleFrom(
          backgroundColor: disabled
              ? Color.fromARGB(100, 23, 23, 29)
              : buttonBackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          side: BorderSide(color: borderColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          prefixIconImage ?? leadingIcon ?? const SizedBox(),
          Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize,
                color: titleColor,
              )),
          // SizedBox(width:3),
          suffixIconImage ?? suffixIcon ?? const SizedBox(),
          // suffixIcon?? const SizedBox(),
        ],
      ),
    );
  }
}
