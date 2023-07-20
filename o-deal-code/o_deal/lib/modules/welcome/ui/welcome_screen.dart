import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/authentication/ui/signup.dart';
import 'package:o_deal/modules/authentication/ui/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                child: Stack(children: [
      Container(
          child: Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child:
                Image(image: AssetImage("assets/icons/logo-white.png"), height: 120),
          )
        ])
      ])),
      Positioned(
          bottom: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 37),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome on O’Deal",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 40),
                    Row(children: [
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ODButton(
                          disabled: false,
                          title: "LOGIN",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => LoginScreen()));
                          },
                          titleColor: const Color(0xFFCB212E),
                          buttonBackgroundColor: const Color(0xFFFFFFFF),
                          borderColor: const Color(0xFFFFFF),
                          borderRadius: 10,
                          titleFontSize: 15,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ODButton(
                          disabled: false,
                          title: "SIGN UP",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => SignupScreen()));
                          },
                          titleColor: const Color(0xFFCB212E),
                          buttonBackgroundColor: const Color(0xFFFFFFFF),
                          borderColor: const Color(0xFFFFFF),
                          borderRadius: 10,
                          titleFontSize: 15,
                        ),
                      ),
                    ])
                  ]))),
    ]))));
  }
}
