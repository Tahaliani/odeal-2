import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoopContent extends StatelessWidget {
  final String text;
  final String description;
  final DecorationImage image;

  const LoopContent({
    Key? key,
    required this.text,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:EdgeInsets.symmetric(horizontal:20),
          decoration: BoxDecoration(
            color:Color(0xFF000000),
            image: image,
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(height:50),
              Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children:[
                  InkWell(
                    onTap: () async {
                      // SharedPreferences sh1 = await SharedPreferences.getInstance();
                      // sh1.setBool("showLoop", false);
                      // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  )
                ]
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.5,
              ),
              Text(
                text,
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.w700,color: Color(0xFFFFFFFF)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  description,
                  style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717171)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              
            ],
          ),
        );
  }
}
