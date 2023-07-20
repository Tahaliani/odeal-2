import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/authentication/ui/signup.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/authentication/ui/verification.dart';
import 'package:o_deal/modules/authentication/ui/login_successful.dart';
import 'package:provider/provider.dart';
import '../../../core/data/notifiers/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password;
  bool checklog = false;
  bool isLoaded = false;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool isLogged = false;

  @override
  void initState() {
    // _savedlogin(context);
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authstate state = Provider.of<authstate>(context, listen: false);
    isLogged = state.IsLoggedIn;
    isLoaded = state.isLoaded;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFCB212E),
            body: Stack(
              alignment: AlignmentDirectional.center,
                children:[ ListView(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => WelcomeScreen()));
                            },
                            child: Icon(Icons.arrow_back,color:Color(0xFFFFFFFF),size:30)),
                      ])),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color:Color(0xFFFFFFFF)),
                        ),
                        SizedBox(height: 28),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email Id or Phone Number",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFFFFF)),
                              ),
                              SizedBox(height: 4),
                              Container(
                                height: 46,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  controller: emailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field can not be empty!';
                                    }
                                    if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value)) {
                                      return "Please enter a valid email address";
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Color(0xFFF6F6F6),
                                    constraints: BoxConstraints.tightFor(
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF6F6F6),
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF6F6F6),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 9),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFFFFF)),
                              ),
                              SizedBox(height: 4),
                              Container(
                                height: 46,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Container(
                                      padding:
                                          EdgeInsets.only(top: 12, right: 10),
                                      child: Text(
                                        "Forgot?",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1F1F1F)),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Color(0xFFF6F6F6),
                                    constraints: BoxConstraints.tightFor(
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF6F6F6),
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF6F6F6),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  controller: passcontroller,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field can not be empty!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 17),
                        SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: ODButton(
                            disabled: state.isLoaded ? false : true,
                            title: "LOGIN",
                            onTap: () async {
                              try {
                                // ignore: use_build_context_synchronously
                                Future<bool> log = state.login(
                                    emailcontroller.text,
                                    passcontroller.text,
                                    context,
                                    true);

                                log.then((value) {
                                  if (!state.IsLoggedIn) {
                                    // print(state.IsLoggedIn.toString() + "dssdsd");
                                    // print(state.error.toString() + "dssdsd");

                                  } else {
                                    print(state.IsLoggedIn);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            LoginSuccessfulScreen(),
                                      ),
                                    );
                                  }
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFF1F1F1F),
                            borderColor: const Color(0xFFFFFF),
                            borderRadius: 10,
                            titleFontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "or, login with... ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              InkWell(
                                onTap: () async {
                                  try {
                                    // ignore: use_build_context_synchronously
                                    Future? log =
                                        await state.googleLogin(context);

                                    log?.then((value) {
                                      if (!state.IsLoggedIn) {
                                        // print(state.IsLoggedIn.toString() + "dssdsd");
                                        // print(state.error.toString() + "dssdsd");

                                      } else {
                                        // print(state.IsLoggedIn);
                                        // Navigator.of(context).pushReplacement(
                                        //   MaterialPageRoute(
                                        //     builder: (ctx) =>
                                        //         VerificationScreen(),
                                        //     // LoginSuccessfulScreen(),
                                        //   ),
                                        // );
                                      }
                                    });
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Container(
                                    height: 45,
                                    width: 90,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color:Color(0xFFFFFFFF),
                                      border: Border.all(
                                          width: 1, color: Color(0xFFDFE1E6)),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/icons/google-logo.png"))),
                              ),
                              SizedBox(width: 18),
                              InkWell(
                                onTap: () async {
                                  try {
                                    // ignore: use_build_context_synchronously
                                    Future? log =
                                        await state.appleLogin(context);

                                    log?.then((value) {
                                      if (!state.IsLoggedIn) {
                                        // print(state.IsLoggedIn.toString() + "dssdsd");
                                        // print(state.error.toString() + "dssdsd");

                                      } else {
                                        print(state.IsLoggedIn);
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (ctx) =>
                                                LoginSuccessfulScreen(),
                                          ),
                                        );
                                      }
                                    });
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Container(
                                    height: 45,
                                    width: 90,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color:Color(0xFFFFFFFF),
                                      border: Border.all(
                                          width: 1, color: Color(0xFFDFE1E6)),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/icons/apple-logo.png"))),
                              ),
                            ])),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        
                      ]))
            ]),
            Positioned(
              bottom:20,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (ctx) => SignupScreen()));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account?",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color:Color(0xFFFFFFFF),)),
                          TextSpan(
                              text: " Signup Now",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F1F1F))),
                        ],
                      ),
                    ),
                  )
                ])
            )])));
  }
}
