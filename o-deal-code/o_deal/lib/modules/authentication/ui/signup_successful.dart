import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/selection/ui/user_vendor_selection.dart';
import 'package:provider/provider.dart';
import '../../../core/data/notifiers/auth_state.dart';

class SignupSuccessfulScreen extends StatefulWidget {
  const SignupSuccessfulScreen({Key? key, this.email, this.password})
      : super(key: key);
  final email;
  final password;
  @override
  _SignupSuccessfulScreenState createState() => _SignupSuccessfulScreenState();
}

class _SignupSuccessfulScreenState extends State<SignupSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    authstate state = Provider.of<authstate>(context, listen: false);
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
                    Container(
                      padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.17),
                      child:Text(
                        "Hang tight while we set you up",
                        textAlign:TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF)),
                      )
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
                          state.login(
                              widget.email, widget.password, context, false);
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
