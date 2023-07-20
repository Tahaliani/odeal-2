import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/selection/ui/user_vendor_selection.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:provider/provider.dart';
import '../../../../core/data/notifiers/auth_state.dart';
import 'package:o_deal/core/data/notifiers/providers.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:o_deal/modules/authentication/ui/signup_successful.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }

  bool verificationSent = false;

  sendOtp(authstate state) async {
    // print(verificationSent);

    controller.loading();
    await state.sendOtp(state.user.id, state.user.phone);
    setState(() {
      verificationSent = state.verificationSent;
      print(verificationSent);
      controller.startTimer();
    });
  }

  String verificationCode = "";

  OtpTimerButtonController controller = OtpTimerButtonController();

  bool resend = false;

  _requestOtp() {
    resend = true;
    controller.loading();
    Future.delayed(Duration(seconds: 2), () {
      controller.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController otp = TextEditingController();
    authstate state = Provider.of<authstate>(context);
    if (!state.verification && !verificationSent) {
      sendOtp(state);
    }

    // if (state.verification) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (ctx) {
    // return state.user.preferences.data.containsKey("type")
    //     ? state.user.preferences.data["type"] == "vendor"
    //         ? const DashboardScreen()
    //         : const RadarScreen()
    //     : const UserVendorSelection();
    //       },
    //     ),
    //   );
    // }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFCB212E),
        body: Container(
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () async {
                              await state.logout();
                              Navigator.pushReplacementNamed(
                                      context, Routes.welcome)
                                  .then((value) {});
                            },
                            child:  Icon(Icons.arrow_back,color:Color(0xFFFFFFFF),size:30)),
                      ])),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Verification Code",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                    Text(
                      "Please enter the 4-digit verification code sent to " +
                          state.user.phone.replaceRange(0, 10, '*' * 10),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 17),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: PinCodeTextField(
                        controller: otp,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          activeColor: const Color(0xFFF6F6F6),
                          activeFillColor: const Color(0xFFF6F6F6),
                          fieldHeight: 46,
                          fieldWidth: 46,
                          inactiveFillColor: const Color(0xFFF6F6F6),
                          inactiveColor: const Color(0xFFF6F6F6),
                          selectedFillColor: const Color(0xFFF6F6F6),
                          selectedColor: const Color(0xFFF6F6F6),
                          errorBorderColor: const Color(0xFFF6F6F6),
                        ),
                        errorAnimationController: null, // Pass it here
                        textStyle: GoogleFonts.poppins(
                          color: const Color(0xFF1F1F1F),
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            // print(value);
                            if (value.length == 6) {
                              verificationCode = value;
                              // print(verificationCode);
                            }
                          });
                        },
                        appContext: context,
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: ODButton(
                        disabled: !verificationSent,
                        title: "LOGIN",
                        onTap: () async {
                          if (verificationSent) {
                            await state.verifyOtp(context, verificationCode,
                                state.user.id, state.user.phone);
                          }
                          // print(verificationCode);
                        },
                        titleColor: const Color(0xFFFFFFFF),
                        buttonBackgroundColor: const Color(0xFF1F1F1F),
                        borderColor: const Color(0xFFFFFF),
                        borderRadius: 10,
                        titleFontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: !resend,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer_outlined, size: 20,color: Color(0xFFFFFFFF)),
                            OtpTimerButton(
                              controller: controller,
                              onPressed: () {
                                setState(() {
                                  _requestOtp();
                                  print("jj");
                                });
                              },
                              text: Text('00 :'),
                              textColor: Color(0xFFFFFFFF),
                              duration: 60,
                              buttonType: ButtonType.text_button,
                              backgroundColor: Color(0xFFFFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: resend,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                resend = false;
                              });
                            },
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Didn't recieve OTP? ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFFFFFF1F1F1F))),
                                  TextSpan(
                                      text: " Resend OTP",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF1F1F1F))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
