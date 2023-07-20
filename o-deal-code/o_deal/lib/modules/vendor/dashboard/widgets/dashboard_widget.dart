import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatelessWidget {
  final Image image;
  final String text;
  final String number;

  const DashboardWidget({
    Key? key,
    required this.image,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom:1),
      child:Container(
        padding:EdgeInsets.symmetric(horizontal:5,vertical:15),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.19),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children:[
                Container(
                  height:70,
                  width:90,
                  child:image
                ),
                SizedBox(height:12),
                Text(
                  number,
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
              ]
            ),
      )
    );
  }
}
