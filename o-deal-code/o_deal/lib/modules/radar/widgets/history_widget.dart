import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryWidget extends StatelessWidget {
  final String text;

  const HistoryWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:13),
        child: Container(
          child:Column(
            children:[
              Row(
                children:[
                  Icon(Icons.history,color: Color(0xFF1F1F1F),size:20),
                  SizedBox(width:12),
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1F1F1F)),
                  ),
                ]
              ),
              SizedBox(height:10),
              Divider(thickness:1,
              color:Color(0xFF000000).withOpacity(0.5))
            ]
          )
        ),);
  }
}
