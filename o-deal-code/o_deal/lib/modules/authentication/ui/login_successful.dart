import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/selection/ui/user_vendor_selection.dart';

class LoginSuccessfulScreen extends StatefulWidget {
  const LoginSuccessfulScreen({Key? key}) : super(key: key);

  @override
  _LoginSuccessfulScreenState createState() => _LoginSuccessfulScreenState();
}

class _LoginSuccessfulScreenState extends State<LoginSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFCB212E),
            body: Stack(children: [
              
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                        child: Image(
                            image: AssetImage("assets/icons/check.png"),color:Color(0xFFFFFFFF),
                            height: 100)),
                    SizedBox(height: 30),
                    Text(
                      "Login Successfully",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: ODButton(
                        disabled: false,
                        title: "CONTINUE",
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => UserVendorSelection()));
                        },
                        titleColor: const Color(0xFFFFFFFF),
                        buttonBackgroundColor: const Color(0xFF1F1F1F),
                        borderColor: const Color(0xFFFFFF),
                        borderRadius: 10,
                        titleFontSize: 15,
                      ),
                    ),
                  ]))
            ])));
  }
}
