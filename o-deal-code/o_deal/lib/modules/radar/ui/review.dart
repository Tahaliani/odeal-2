import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/modules/radar/ui/single_store.dart';
import 'package:o_deal/modules/radar/widgets/review_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key, required this.store}) : super(key: key);

  final Store store;
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEDF3F6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15BBBA),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => SingleStoreScreen(store: widget.store)));
            },
            child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
        actions: [
          Container(
              height: 34,
              width: 34,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFF1A6A8F),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.add))
        ],
        title: Text(
          "Reviews",
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Container(
          child: ListView(children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Overall Rating",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
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
                              color: Color(0xFFF9C81B), size: 12),
                          half: const Icon(Icons.star_half,
                              color: Color(0xFFF9C81B), size: 12),
                          empty: const Icon(Icons.star_outline,
                              color: Color(0xFFF9C81B), size: 14)),
                      onRatingUpdate: (value) {}),
                  const SizedBox(width: 3),
                ]),
              ]),
              SizedBox(height: 20),
              ReviewWidget(),
              ReviewWidget(),
              ReviewWidget(),
              ReviewWidget(),
            ]))
      ])),
    ));
  }
}
