import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFCB212E),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/doodle.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/icons/logo-white.png"), height: 60),
                  SizedBox(width: 4),
                  Text(
                    "O’ Deal",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 63,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
              Center(
                child:Text(
                  "Here’s the deal",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF)),
                ),
              )
            ]
          ),
        )
        ),
      ),
    );
  }
}
