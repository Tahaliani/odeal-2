import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/data/models/store.dart';

class StoreCard extends StatefulWidget {
  // final Image image;

  const StoreCard({
    Key? key,
    required this.store,
    // required this.image,
  }) : super(key: key);

  final Store store;
  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 1),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
            // padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10)),
            child:
             Stack(
              alignment: Alignment.center,
              children:[
                Positioned(
                  top:1,
                  child:Image(
                    image: AssetImage("assets/images/store-card-bg.png"),
                    height:MediaQuery.of(context).size.height*0.09),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height*0.035),
                  Image(
                    image: NetworkImage(
                      widget.store.image.toString(),
                    ),
                    height: 67,
                  ),
                  SizedBox(height: 5),
                  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Text(
                      widget.store.name,
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F1F1F)),
                    ),
                    SizedBox(height: 2),
                    InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Color(0xFFFFC107), size: 20),
                            Text(
                              widget.store.reviews.toString() + " Review",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1F1F1F)),
                            ),
                          ]),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,children: [
                        InkWell(
                          onTap:(){},
                          child:Row(
                            children:[
                              Icon(Icons.location_on,size: 13, color: Color(0xFF1F1F1F)),
                              Text(
                                "Directions",
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1F1F1F)),
                              ),
                            ]
                          ),
                        ),
                        SizedBox(width:4),
                        InkWell(
                          onTap:(){},
                          child:Row(
                            children:[
                              Icon(Icons.phone,size: 13, color: Color(0xFFCB212E)),
                              Text(
                                "Call Now",
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFCB212E)),
                              ),
                            ]
                          ),
                        ),
                    ]),
                  ])
                ])
              ]
             )));
  }
}
