import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/core/data/models/user.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/vendor/scan/ui/vendor_qr.dart';
import 'package:o_deal/modules/vendor/profile/ui/profile_screen.dart';
import 'package:o_deal/modules/vendor/products/ui/order_list.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:provider/provider.dart';
import '../../../../core/data/notifiers/auth_state.dart';
import '../../../drawer/drawer.dart';
import 'package:appwrite/models.dart' as models;
import 'package:o_deal/core/data/models/user.dart' as UserModel;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  final UserModel.User? user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color _containerColor = Colors.white;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  late authstate state;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user!.name;
    phoneController.text = widget.user!.phone;
    emailController.text = widget.user!.email;
    addressController.text =
        widget.user!.preferences.data.containsKey("address")
            ? widget.user!.preferences.data["address"]
            : "";
    aboutController.text = widget.user!.preferences.data.containsKey("about")
        ? widget.user!.preferences.data["about"]
        : "";
  }

  bool gotState = false;
  getState(context) {
    if (!gotState) {
      setState(() {
        state = Provider.of<authstate>(context, listen: false);
        gotState = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getState(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFEDF3F6),

        drawer: const AppDrawer(),
        // // ******************************DRAWER**************************************************************
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
          leading: Container(
            height: 40,
            width: 40,
            child: Builder(
              builder: (context) => IconButton(
                icon: ImageIcon(
                  AssetImage("assets/icons/menu.png"),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
          actions:[
            InkWell(
              onTap:(){},
              child:Container(
                padding:EdgeInsets.symmetric(vertical:25,horizontal:15),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image(
                      image: AssetImage(
                          "assets/images/vendor-profile.png"),
                      fit: BoxFit.cover,
                      height: 30,width:30))
              )
            )
          ]
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
                bottom: 20,
                child: Row(children: [
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ODButton(
                      disabled: false,
                      title: "SAVE",
                      onTap: () async {
                        var preferences = {
                          "about": aboutController.text.toString(),
                          "address": addressController.text.toString(),
                        };
                        await state.updateProfile(
                          null,
                          emailController.text.toString(),
                          phoneController.text.toString(),
                          null,
                          preferences,
                        );
                      },
                      titleColor: const Color(0xFFFFFFFF),
                      buttonBackgroundColor: const Color(0xFF1F1F1F),
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
                      title: "DEACTIVE",
                      onTap: () {},
                      titleColor: const Color(0xFFFFFFFF),
                      buttonBackgroundColor: const Color(0xFFCB212E),
                      borderColor: const Color(0xFFFFFF),
                      borderRadius: 10,
                      titleFontSize: 15,
                    ),
                  ),
                ])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ListView(
                children: [
                  Container(
                    // padding:EdgeInsets.symmetric(horizontal:30,vertical:25),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/images/vendor-profile.png"),
                                fit: BoxFit.cover,
                                height: 76)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1F1F1F)),
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  // Text(
                                  //   state.user.name,
                                  //   style: GoogleFonts.poppins(
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.w500,
                                  //       color: Color(0xFF1F1F1F)),
                                  // ),
                                  Visibility(
                                    visible: state.user.verified,
                                    child: const Icon(
                                      Icons.verified,
                                      color: Color(0xFF1A6A8F),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                widget.user!.preferences.data
                                        .containsKey("type")
                                    ? widget.user!.preferences.data["type"] ==
                                            "vendor"
                                        ? "Vendor"
                                        : "Customer"
                                    : "Owner",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF6B6B6B)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(children: [
                    Icon(Icons.phone, color: Color(0xFFCB212E)),
                    SizedBox(width: 4),
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F1F1F)),
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // Text(
                    //   state.user.phone,
                    //   style: GoogleFonts.poppins(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //       color: Color(0xFF1F1F1F)),
                    // )
                  ]),
                  Row(children: [
                    Icon(Icons.mail, color: Color(0xFFCB212E)),
                    SizedBox(width: 4),
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(31, 31, 31, 1)),
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // Text(
                    //   state.user.email,
                    //   style: GoogleFonts.poppins(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //       color: Color(0xFF1F1F1F)),
                    // )
                  ]),
                  Row(children: [
                    Icon(Icons.location_on, color: Color(0xFFCB212E)),
                    SizedBox(width: 4),
                    // Text(
                    //   state.user.preferences.data.containsKey("address")
                    //       ? state.user.preferences.data["address"]
                    //       : "",
                    //   style: GoogleFonts.poppins(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //       color: Color(0xFF1F1F1F)),
                    // )
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F1F1F)),
                        controller: addressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  SizedBox(height: 20),
                  Text(
                    "About:",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1F1F)),
                  ),
                  Expanded(
                    child: TextFormField(
                      maxLines: null,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F1F1F)),
                      controller: aboutController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                   
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
