import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/helper_state.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/drawer/drawer.dart';
import 'package:o_deal/modules/radar/widgets/history_widget.dart';
import 'package:o_deal/modules/scan/ui/qr_code.dart';
import 'package:o_deal/modules/radar/ui/store_list.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/radar/ui/store_list.dart';
import 'package:o_deal/core/navigation/routing.dart';

import 'package:provider/provider.dart';

class RadarScreen extends StatefulWidget {
  const RadarScreen({Key? key}) : super(key: key);

  @override
  _RadarScreenState createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen> {
  bool isFetched = false;

  List<Widget> cats = [];

  fetchStores(HelperState hs, StoreState ps, context) async {
    if (!isFetched) {
      setState(() {
        isFetched = true;
        cats = [
          Container(
            child: Image(
              image: AssetImage("assets/images/radar-ellipse.png"),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: MediaQuery.of(context).size.height * 0.217,
            child: const Center(
              child: Image(
                image: AssetImage("assets/icons/logo-white.png"),
                height: 36,
              ),
            ),
          ),
        ];
      });
      await hs.getMyLocation(context);
      await ps.getStores(context);
      // print(hs.currentPosition);
      // print(hs.currentAddress);
      setState(() {
        // print("dddd");
        for (var store in ps.stores) {
          // print("dddd");
          cats.add(
            Positioned.directional(
              top: MediaQuery.of(context).size.height *
                  Random().nextDouble().clamp(0.07, 0.5),
              start: MediaQuery.of(context).size.width *
                  Random().nextDouble().clamp(0.07, 0.5),
              textDirection: TextDirection.ltr,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => StoreListScreen(),
                    ),
                  );
                },
                child: const IgnorePointer(
                  child: Center(
                    child: Image(
                        image: AssetImage("assets/icons/radar-17.png"),
                        height: 76),
                  ),
                ),
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("ddd");

    StoreState ss = Provider.of<StoreState>(context);
    HelperState hs = Provider.of<HelperState>(context);
    fetchStores(hs, ss, context);

    return SafeArea(
      child: Scaffold(
        // ***********************DRAWER*************************************************
        // drawer: Drawer(
        //     child: ListView(children: [
        //   Container(
        //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        //       child: Column(children: [
        //         Row(children: [
        //           Image(image: AssetImage("assets/icons/logo.png"), height: 40),
        //           SizedBox(width: 10),
        //           Text(
        //             "O' Deal",
        //             style: GoogleFonts.poppins(
        //                 fontSize: 35,
        //                 fontWeight: FontWeight.w500,
        //                 color: Color(0xFF000000)),
        //           ),
        //         ]),
        //         Divider(thickness: 1),
        //         Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/offer.png"), height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Offer Near By",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         ),
        //         Divider(thickness: 1),
        //         InkWell(
        //             onTap: () {
        //               Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(builder: (ctx) => StoreListScreen()));
        //             },
        //             child: Container(
        //               padding: EdgeInsets.symmetric(vertical: 10),
        //               child: Row(children: [
        //                 Image(
        //                     image: AssetImage("assets/icons/box.png"),
        //                     height: 25),
        //                 SizedBox(width: 10),
        //                 Text(
        //                   "All Products",
        //                   style: GoogleFonts.poppins(
        //                       fontSize: 20,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xFF000000)),
        //                 ),
        //               ]),
        //             )),
        //         Divider(thickness: 1),
        //         Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(image: AssetImage("assets/icons/bag.png"), height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Orders",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         ),
        //         Divider(thickness: 1),
        //         Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/person.png"), height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Profile",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         ),
        //         Divider(thickness: 1),
        //         Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/setting.png"),
        //                 height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Setting",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         ),
        //         Divider(thickness: 1),
        //         InkWell(
        //             onTap: () {
        //               Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(builder: (ctx) => QRCodeScreen()));
        //             },
        //             child: Container(
        //               padding: EdgeInsets.symmetric(vertical: 10),
        //               child: Row(children: [
        //                 Image(
        //                     image: AssetImage("assets/icons/scanner.png"),
        //                     height: 25),
        //                 SizedBox(width: 10),
        //                 Text(
        //                   "Shop QR",
        //                   style: GoogleFonts.poppins(
        //                       fontSize: 20,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xFF000000)),
        //                 ),
        //               ]),
        //             )),
        //         Divider(thickness: 1),
        //         InkWell(
        //             onTap: () {
        //               Navigator.of(context).pushNamedAndRemoveUntil(
        //                   Routes.rangeSelector, (_) => false);
        //             },
        //             child: Container(
        //               padding: EdgeInsets.symmetric(vertical: 10),
        //               child: Row(children: [
        //                 Image(
        //                     image: AssetImage("assets/icons/setting.png"),
        //                     height: 25),
        //                 SizedBox(width: 10),
        //                 Text(
        //                   "Range Selector",
        //                   style: GoogleFonts.poppins(
        //                       fontSize: 20,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xFF000000)),
        //                 ),
        //               ]),
        //             )),
        //         Divider(thickness: 1),
        //         InkWell(
        //             onTap: () {
        //               Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(builder: (ctx) => WelcomeScreen()));
        //             },
        //             child: Container(
        //               padding: EdgeInsets.symmetric(vertical: 10),
        //               child: Row(children: [
        //                 Image(
        //                     image: AssetImage("assets/icons/logout.png"),
        //                     height: 25),
        //                 SizedBox(width: 10),
        //                 Text(
        //                   "Logout",
        //                   style: GoogleFonts.poppins(
        //                       fontSize: 20,
        //                       fontWeight: FontWeight.w500,
        //                       color: Color(0xFF000000)),
        //                 ),
        //               ]),
        //             )),
        //         Divider(thickness: 1),
        //       ]))
        // ])),

        drawer: AppDrawer(),
        // // ******************************DRAWER**************************************************************
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/map.png"),
                  fit: BoxFit.cover)),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              showFlexibleBottomSheet(
                                minHeight: 0,
                                initHeight: 0.8,
                                maxHeight: 0.8,
                                context: context,
                                builder: _buildBottomSheet,
                                isExpand: false,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              );
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: Icon(Icons.search,
                                    color: Color(0xFFCB212E)))),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Builder(
                            builder: (context) => IconButton(
                              icon: Image.asset("assets/icons/setting.png"),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                            ),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  flex: 15,
                  child: Stack(
                    children: cats,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        height: 700,
        child:
            ListView(controller: scrollController, shrinkWrap: true, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(
                "Find your place!",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F1F1F)),
              ),
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child:Icon(Icons.close,size: 25, color: Color(0xFF1F1F1F)),
              ),
            ]
          ),
          SizedBox(height: 11),
          Container(
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                fillColor: Color(0xFF5E5E5E).withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search, color: Color(0xFF1F1F1F)),
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFFFFFFFF).withOpacity(0.1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFFFFFFFF).withOpacity(0.1),
                    width: 1.0,
                  ),
                ),
                hintText: 'Search Here...',
                hintStyle: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 14,
                ),
              ))),
          SizedBox(height: 14),
          Column(children: [
            HistoryWidget(text: "Grocery Store In Ontario"),
            HistoryWidget(text: "Fitness Gym In Brampton"),
            HistoryWidget(text: "Zara Store In Canada"),
            HistoryWidget(text: "Welness Spa In Ontario"),
            HistoryWidget(text: "Welness Spa In Ontario"),
          ])
        ]),
      ),
    );
  }
}
