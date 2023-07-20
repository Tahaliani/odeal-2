import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:o_deal/core/data/notifiers/providers.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/vendor/dashboard/widgets/dashboard_widget.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/vendor/scan/ui/vendor_qr.dart';
import 'package:o_deal/modules/vendor/profile/ui/profile_screen.dart';
import 'package:o_deal/modules/vendor/products/ui/order_list.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:o_deal/modules/vendor/shop/ui/all_products.dart';
import 'package:o_deal/modules/vendor/shop/ui/vendor_shop_screen.dart';
import 'package:o_deal/modules/radar/widgets/history_widget.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

import '../../../drawer/drawer.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isFetched = false;
  fetchStore(StoreState ps, context) {
    if (!isFetched) {
      ps.getStore(null, context);
      isFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    StoreState ss = Provider.of<StoreState>(context);
    fetchStore(ss, context);
    Store? store = ss.store;
    return SafeArea(
      child: Scaffold(
        // ***********************DRAWER*************************************************
        drawer: AppDrawer(),
        // ******************************DRAWER**************************************************************
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
                  size: 24,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          title: Text(
            "Dashboard",
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
          actions:[
            InkWell(
              onTap:(){
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,  
            mainAxisSpacing: 10.0,  
            childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height/1.7),
            children: [
              DashboardWidget(
                  text: "Total Products ",
                  number: store == null ? "0" : store.total_products.toString(),
                  image: Image(image: AssetImage("assets/icons/product.png"),color:Color(0xFFCB212E))),
              DashboardWidget(
                  text: "Total Customer",
                  number: store == null ? "0" : store.total_customer.toString(),
                  image: Image(image: AssetImage("assets/icons/customer.png"),color:Color(0xFFCB212E))),
              DashboardWidget(
                  text: "Total orders",
                  number: store == null ? "0" : store.total_orders.toString(),
                  image: Image(image: AssetImage("assets/icons/order.png"),color:Color(0xFFCB212E))),
              DashboardWidget(
                  text: "Offer Claimed ",
                  number: store == null ? "0" : store.offer_claimed.toString(),
                  image: Image(
                      image: AssetImage("assets/icons/offer.png"),color:Color(0xFFCB212E))),
            ],
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
        height: MediaQuery.of(context).size.height*0.6,
        child:
            ListView(controller: scrollController, shrinkWrap: true, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Row(
                children:[
                  Container(
                    // padding:EdgeInsets.symmetric(horizontal:15),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image(
                          image: AssetImage(
                              "assets/images/vendor-profile.png"),
                          fit: BoxFit.cover,
                          height: 30,width:30))
                  ),
                  SizedBox(width:6),
                  Text(
                    "Jhon Deo",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1F1F)),
                  ),
                ]
              ),
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child:Icon(Icons.close,size: 25, color: Color(0xFF1F1F1F)),
              ),
            ]
          ),
          SizedBox(height: 14),
          Column(
            children: [
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:10),
                Text(
                  "My deals",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                SizedBox(height:10),
                Divider(thickness:1,
                color:Color(0xFF000000).withOpacity(0.2))
              ]
            ),
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:10),
                Text(
                  "Notification",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                SizedBox(height:10),
                Divider(thickness:1,
                color:Color(0xFF000000).withOpacity(0.2))
              ]
            ),
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:10),
                Text(
                  " Change my mobile number",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                SizedBox(height:10),
                Divider(thickness:1,
                color:Color(0xFF000000).withOpacity(0.2))
              ]
            ),
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:10),
                Text(
                  "Refer O’deal to your friends",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                SizedBox(height:10),
                Divider(thickness:1,
                color:Color(0xFF000000).withOpacity(0.2))
              ]
            ),
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:10),
                Text(
                  "Privacy Policy",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                SizedBox(height:10),
                Divider(thickness:1,
                color:Color(0xFF000000).withOpacity(0.2))
              ]
            ),
            Column(
            crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:10),
                Text(
                  "User Agreement",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F1F1F)),
                ),
                SizedBox(height:10),
                Divider(thickness:1,
                color:Color(0xFF000000).withOpacity(0.2))
              ]
            ),
          ])
        ]),
      ),
    );
  }
}
