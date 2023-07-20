import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCancelled extends StatelessWidget {
  // final Image image;
  // final String text;

  const OrderCancelled({
    Key? key,
    // required this.image,
    // required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom:10),
      child:Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:Color(0xFFFFFFFF)
        ),
        padding:EdgeInsets.all(8),
        width:MediaQuery.of(context).size.width,
        child:Row(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child:Image(
                image:AssetImage("assets/images/item-1.png"),
                fit: BoxFit.cover,
                height:78
              )
            ),
            SizedBox(width:10),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Text(
                  "Order#: 34583",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                Text(
                  "10-Nov-2022, 4:30 PM",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFB4B4B4)),
                ),
                Text(
                  "Status: Cancelled",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF0000)),
                ),
              ]
            )
          ]
        )
      )
    );
  }
}
