import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gif_view/gif_view.dart';
import 'package:o_deal/modules/selection/widgets/selection_item.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/payment/ui/payment_denied.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  _PaymentSuccessfulState createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  Color _containerColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFCB212E),
            body: Stack(children: [
              // Positioned(
              //     bottom: 0,
              //     child: Image(
              //         image: AssetImage("assets/images/bg.png"),
              //         width: MediaQuery.of(context).size.width)),
              Center(
                  child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 50),
                              height: MediaQuery.of(context).size.height * 0.52,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image:AssetImage("assets/icons/check.png"),
                                      height:100,
                                      color:Color(0xFFFFFFFF)
                                    ),
                                    SizedBox(height:30),
                                    Text(
                                      "Payment Succesfull",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF)),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width:MediaQuery.of(context).size.width*0.8,
                                      child:Text(
                                        "You will recieve a confirmation message in a few minutes.",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFFFFFFF)),
                                      )
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      height: 48,
                                      width:MediaQuery.of(context).size.width,
                                      child: ODButton(
                                        disabled: false,
                                        title: "CONTINUE",
                                        onTap: () {
                                        //   Navigator.of(context).pushReplacement(
                                        //     MaterialPageRoute(
                                        //       builder: (ctx) =>
                                        //           PaymentDenied(),));
                                        },
                                        titleColor: const Color(0xFFFFFFFF),
                                        buttonBackgroundColor: const Color(0xFF1F1F1F),
                                        borderColor: const Color(0xFFFFFF),
                                        borderRadius: 5,
                                        titleFontSize: 15,
                                      ),
                                    ),
                                  ])))))
            ])));
  }
}
