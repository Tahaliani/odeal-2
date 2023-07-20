import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/authentication/ui/login.dart';
import 'package:o_deal/modules/authentication/ui/signup_successful.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/authentication/ui/verification.dart';
import 'package:provider/provider.dart';
import '../../../core/data/notifiers/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _number = "";
  String? _number_country = 'IN';
  String? _number_country_code = '+91';
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobileno = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var isValid = false;

  @override
  void initState() {
    super.initState();
    emailcontroller.text = "";
  }

  bool butDis = false;

  @override
  Widget build(BuildContext context) {
    authstate state = Provider.of<authstate>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFCB212E),
            body: Container(
                child: ListView(children: [
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
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Signup",
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
                                  "Full Name",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:Color(0xFFFFFFFF)),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 46,
                                  child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      controller: namecontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Field Can not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Color(0xFFF6F6F6),
                                        constraints: BoxConstraints.tightFor(
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
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
                                  "Email Id",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:Color(0xFFFFFFFF)),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 46,
                                  child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      controller: emailcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Field Can not be empty";
                                        }
                                        if (!RegExp(r'\S+@\S+\.\S+')
                                            .hasMatch(value)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text(
                                                  "Please enter a valid email address!",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Color(0xFFF6F6F6),
                                        constraints: BoxConstraints.tightFor(
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
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
                                  "Phone Number",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:Color(0xFFFFFFFF)),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 46,
                                  child: TextFormField(
                                    controller: mobileno,
                                    keyboardType: TextInputType.phone,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Field Can not be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Color(0xFFF6F6F6),
                                      constraints: BoxConstraints.tightFor(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                      color:Color(0xFFFFFFFF)),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 46,
                                  child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      controller: passcontroller,
                                      validator: (value) {
                                        RegExp regex = RegExp(
                                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                        if (value == null || value.isEmpty) {
                                          return "Field Can not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        // suffixIcon: Container(
                                        //   padding:
                                        //       EdgeInsets.only(top: 12, right: 10),
                                        //   child: Text(
                                        //     "Forgot?",
                                        //     style: GoogleFonts.poppins(
                                        //         fontSize: 14,
                                        //         fontWeight: FontWeight.w400,
                                        //         color: Color(0xFF15BBBA)),
                                        //   ),
                                        // ),
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Color(0xFFF6F6F6),
                                        constraints: BoxConstraints.tightFor(
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 17),
                          SizedBox(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            child: ODButton(
                              disabled: butDis ? true : false,
                              title: "SIGNUP",
                              onTap: () async {
                                setState(() {
                                  butDis = true;
                                });
                                String phone = "${mobileno.text}";
                                if (_formkey.currentState!.validate()) {
                                  Future signup = await state.signup(
                                    namecontroller.text,
                                    emailcontroller.text,
                                    passcontroller.text,
                                    phone,
                                    '{}',
                                    context,
                                  );
                                  signup.then((value) {
                                    setState(() {
                                      butDis = false;
                                    });
                                  });
                                  // if (state.funstatus) {
                                  //   // ignore: use_build_context_synchronously
                                  //   Navigator.pushReplacementNamed(
                                  //       context, AppRoutes.login);
                                  // } else {
                                  //   // ignore: use_build_context_synchronously
                                  //   errorsnackbar(context, state.funerror);
                                  // }
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
                                  "or, signup with... ",
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
                                      Future log =
                                          await state.googleLogin(context);

                                      log.then((value) {
                                        if (!state.IsLoggedIn) {
                                          // print(state.IsLoggedIn.toString() + "dssdsd");
                                          // print(state.error.toString() + "dssdsd");

                                        } else {
                                          print(state.IsLoggedIn);
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (ctx) =>
                                                  SignupSuccessfulScreen(),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                            width: 1, color: Color(0xFFFFFFFF)),
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
                                      Future log =
                                          await state.appleLogin(context);

                                      log.then((value) {
                                        if (!state.IsLoggedIn) {
                                          // print(state.IsLoggedIn.toString() + "dssdsd");
                                          // print(state.error.toString() + "dssdsd");
                                        } else {
                                          print(state.IsLoggedIn);
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (ctx) =>
                                                  SignupSuccessfulScreen(),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                            width: 1, color: Color(0xFFFFFFFF)),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Image(
                                          image: AssetImage(
                                              "assets/icons/apple-logo.png"))),
                                ),
                              ])),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => LoginScreen()));
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "Don't have an account?",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFFFFFFF))),
                                          TextSpan(
                                              text: " Login Now",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFF1F1F1F))),
                                        ],
                                      ),
                                    )),
                              ]),
                              SizedBox(height:20)
                        ]),
                  ))
            ]))));
  }
}
