import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/vendor/products/widgets/order_completed.dart';
import 'package:o_deal/modules/vendor/products/widgets/order_cancelled.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/vendor/scan/ui/vendor_qr.dart';
import 'package:o_deal/modules/vendor/profile/ui/profile_screen.dart';
import 'package:o_deal/modules/vendor/products/ui/order_list.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';

import '../../../drawer/drawer.dart';

class OrderIdScreen extends StatefulWidget {
  const OrderIdScreen({Key? key, this.order}) : super(key: key);

  final order;

  @override
  _OrderIdScreenState createState() => _OrderIdScreenState();
}

class _OrderIdScreenState extends State<OrderIdScreen> {
  Color _containerColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ***********************DRAWER*************************************************
        // drawer: Drawer(
        //     child: ListView(children: [
        //   Container(
        //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        //       child: Column(children: [
        //         Row(children: [
        //           Image(
        //               image: AssetImage("assets/icons/logo.png"),
        //               height: 40),
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
        //         InkWell(
        //           onTap:(){
        //             Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(
        //                       builder: (ctx) =>  DashboardScreen()));
        //           },
        //           child:Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/dashboard.png"),
        //                 height: 25,width:25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Dashboard",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         )
        //         ),
        //         Divider(thickness: 1),
        //         InkWell(
        //           onTap:(){},
        //           child:Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/box.png"),
        //                 height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "All Products",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         )
        //         ),
        //         Divider(thickness: 1),
        //         InkWell(
        //           onTap:(){
        //             Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(
        //                       builder: (ctx) =>  OrderListScreen()));
        //           },
        //           child:Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/bag.png"),
        //                 height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Orders",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         )
        //         ),
        //         Divider(thickness: 1),
        //         InkWell(
        //           onTap:(){
        //             Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(
        //                       builder: (ctx) =>  ProfileScreen()));
        //           },
        //           child:Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/person.png"),
        //                 height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Profile",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         )
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
        //           onTap:(){
        //             Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(
        //                       builder: (ctx) =>  VendorQRCodeScreen()));
        //           },
        //           child:Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/scanner.png"),
        //                 height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Shop QR",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         )
        //         ),
        //         Divider(thickness: 1),
        //         InkWell(
        //           onTap:(){
        //              Navigator.of(context).pushReplacement(
        //                   MaterialPageRoute(
        //                       builder: (ctx) =>  WelcomeScreen()));
        //           },
        //           child:Container(
        //           padding: EdgeInsets.symmetric(vertical: 10),
        //           child: Row(children: [
        //             Image(
        //                 image: AssetImage("assets/icons/logout.png"),
        //                 height: 25),
        //             SizedBox(width: 10),
        //             Text(
        //               "Logout",
        //               style: GoogleFonts.poppins(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w500,
        //                   color: Color(0xFF000000)),
        //             ),
        //           ]),
        //         )
        //         ),
        //         Divider(thickness: 1),
        //       ]))
        // ])),

        drawer: AppDrawer(),
        // // ******************************DRAWER**************************************************************
        backgroundColor: Color(0xFFEDF3F6),
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
            "Order#: " + widget.order.id,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
          actions:[
            InkWell(
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

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 27),
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Customer Name :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.customer_name,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Customer Number :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.customer_number,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Product Name :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.product.name,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Date :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.created_on,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Time :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.created_on,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Product Price :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.product.price.toString() + "/- Rs",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Payment Id :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.payment_id,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
                  ])),
              Divider(thickness: 1),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Text(
                        "Payment Status :",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F1F1F)),
                      ),
                    ),
                    Text(
                      widget.order.payment_status,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1F1F1F)),
                    ),
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
