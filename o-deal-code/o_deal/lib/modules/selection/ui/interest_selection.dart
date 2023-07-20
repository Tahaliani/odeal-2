import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/modules/selection/widgets/selection_interest.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';

class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({Key? key}) : super(key: key);

  @override
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  Color _containerColor = Color(0xFFFFFFFF);
  Color _imageColor = Color(0xFF1A6A8F);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEDF3F6),
      appBar: AppBar(
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0)
          )
        ),
        // elevation: 8,
        centerTitle: true,
        backgroundColor: Color(0xFFCB212E),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => RadarScreen()));
            },
            child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
        title: Text(
          "Choose Your interest",
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            children:[
              ListView(children: [
            Container(
                child: GridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height * 0.55),
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0,
                    shrinkWrap: true,
                    children: [
                  SelectionInterest(
                      image: Image(
                          image: AssetImage("assets/icons/sports.png"),
                          height: 50,
                          color: Color(0xFFCB212E)),
                      text: "Sports"),
                  SelectionInterest(
                      image: Image(
                          image: AssetImage("assets/icons/food.png"),
                          height: 50,
                          color: Color(0xFFCB212E)),
                      text: "Food"),
                  SelectionInterest(
                      image: Image(
                          image: AssetImage("assets/icons/fashion.png"),
                          height: 50,
                          color: Color(0xFFCB212E)),
                      text: "Fashion"),
                  SelectionInterest(
                      image: Image(
                          image: AssetImage("assets/icons/fitness.png"),
                          height: 50,
                          color: Color(0xFFCB212E)),
                      text: "Fitness"),
                  SelectionInterest(
                      image: Image(
                          image: AssetImage("assets/icons/grocery.png"),
                          height: 50,
                          color: Color(0xFFCB212E)),
                      text: "Grocery"),
                  SelectionInterest(
                      image: Image(
                          image: AssetImage("assets/icons/wellness.png"),
                          height: 50,
                          color: Color(0xFFCB212E)),
                      text: "Wellness"),
                ])),
            SizedBox(height: 20),
            
          ]),
          Positioned(
            bottom:20,
            child:SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ODButton(
                disabled: false,
                title: "CONTINUE",
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => RadarScreen()));
                },
                titleColor: const Color(0xFFFFFFFF),
                buttonBackgroundColor: const Color(0xFF1F1F1F),
                borderColor: const Color(0xFFFFFF),
                borderRadius: 10,
                titleFontSize: 15,
              ),
            ),
          )
            ]
          )),
    ));
  }
}
