import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionInterest extends StatelessWidget {
  final Image image;
  final String text;

  const SelectionInterest({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //  height:164,
            //  width:164,
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.19),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
            child: Column(children: [
              image,
              SizedBox(height: 12),
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F1F1F)),
              ),
            ])));
  }
}
