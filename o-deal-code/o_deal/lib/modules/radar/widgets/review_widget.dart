import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewWidget extends StatelessWidget {
  // final Image image;

  const ReviewWidget({
    Key? key,
    // required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          padding:EdgeInsets.all(15),
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
                      child:Row(
                        children:[
                          Expanded(
                            child:Column(
                            children:[
                              Row(
                                children:[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                    child:Image(image:AssetImage("assets/images/profile.png"),
                                    width: 45)
                                  ),
                              SizedBox(width:9),
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Text(
                                    "Jhon Smith",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF1F1F1F)),
                                  ),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children:[
                                      Row(children: [
                                        Text(
                                          "4.2 ",
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF1F1F1F)),
                                        ),
                                        RatingBar(
                                            initialRating: 4,
                                            minRating: 4,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 12.0,
                                            ratingWidget: RatingWidget(
                                                full: const Icon(Icons.star,
                                                    color:
                                                        Color(0xFFF9C81B),
                                                    size: 12),
                                                half: const Icon(
                                                    Icons.star_half,
                                                    color:
                                                        Color(0xFFF9C81B),
                                                    size: 12),
                                                empty: const Icon(
                                                    Icons.star_outline,
                                                    color:
                                                        Color(0xFFF9C81B),
                                                    size: 14)),
                                            onRatingUpdate: (value) {}),
                                        const SizedBox(width: 3),
                                     ]),
                                     Row(
                                      mainAxisAlignment:MainAxisAlignment.end,
                                      children:[
                                        Text(
                                          "3 day  ago",
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF1F1F1F)),
                                        ),
                                      ]
                                     )
                                    ]
                                  )
                                ]
                              )
                                ]
                              ),
                              SizedBox(height:4),
                              Container(
                                child:
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    textAlign:TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF1F1F1F)),
                                  ),
                                
                              ),
                              SizedBox(height:15),
                              // Divider(thickness:1,color:Color(0xFF333333).withOpacity(0.5))
                            ]
                          )
                          )
                        ]
                      )
                    ));
  }
}
