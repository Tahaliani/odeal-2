import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/modules/orders/ui/orders_screen.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/setting/ui/setting_screen.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/vendor/scan/ui/vendor_qr.dart';
import 'package:o_deal/modules/vendor/profile/ui/profile_screen.dart';
import 'package:o_deal/modules/vendor/products/ui/order_list.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:o_deal/modules/vendor/shop/ui/all_products.dart';
import 'package:o_deal/modules/vendor/shop/ui/vendor_shop_screen.dart';
import 'package:provider/provider.dart';

import 'package:o_deal/modules/radar/ui/range_selector.dart';
import '../../core/data/notifiers/auth_state.dart';
import '../../core/navigation/routing.dart';
import '../radar/ui/store_list.dart';
import '../scan/ui/qr_code.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authstate as = Provider.of<authstate>(context);
    if (as.user.preferences.data["type"] == "user") {
      return Drawer(
        child: Stack(
          children:[
            
            ListView(
              children: [
                Container(
                  height:MediaQuery.of(context).size.height*1,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  color:Color(0xFFCB212E),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage("assets/icons/logo-white.png"),
                              height: 40),
                          SizedBox(width: 10),
                          Text(
                            "O' Deal",
                            style: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ],
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => RadarScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/offer.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Offer Near By",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => StoreListScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/box.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "All Products",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => OrdersScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/bag.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Orders",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => ProfileScreen(
                                  user: Provider.of<authstate>(context).user),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/person.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Profile",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => const SettingScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/setting.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Setting",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => QRCodeScreen(
                                    product: null,
                                    store: null,
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/scanner.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Shop QR",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => RangeSelectorScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/setting.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Range Selector",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                      InkWell(
                        onTap: () async {
                          authstate state =
                              Provider.of<authstate>(context, listen: false);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Log Out"),
                              content:
                                  const Text("Are you sure you want to log out?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('CANCEL'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    state.logout();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/', (_) => false);
                                  },
                                  child: const Text('LOG OUT'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage("assets/icons/logout.png"),
                                  height: 25,color: Color(0xFFFFFFFF)),
                              SizedBox(width: 10),
                              Text(
                                "Logout",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom:1,
              child:Image(
                image: AssetImage("assets/icons/drawer-logo.png"),
                height:MediaQuery.of(context).size.height*0.3),
            ),
          ]
        ),
      );
    } else {
      return Drawer(
          child: Stack(
            children:[
              ListView(
                  children: [
                    Container(
                      color:Color(0xFFCB212E),
                      height:MediaQuery.of(context).size.height*1,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        child: Column(children: [
                          Row(children: [
                            Image(image: AssetImage("assets/icons/logo-white.png"), height: 40),
                            SizedBox(width: 10),
                            Text(
                              "O' Deal",
                              style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ]),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (ctx) => DashboardScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/dashboard.png"),
                                      height: 25,
                                      width: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "Dashboard",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (ctx) => AllProductScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/box.png"),
                                      height: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "All Products",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (ctx) => OrderListScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/bag.png"),
                                      height: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "Orders",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (ctx) => ProfileScreen(
                                        user: Provider.of<authstate>(context).user)));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/person.png"),
                                      height: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "Profile",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.settingScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(children: [
                                Image(
                                    image: AssetImage("assets/icons/setting.png"),
                                    height: 25,color: Color(0xFFFFFFFF)),
                                SizedBox(width: 10),
                                Text(
                                  "Setting",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF)),
                                ),
                              ]),
                            ),
                          ),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (ctx) => VendorQRCodeScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/scanner.png"),
                                      height: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "Shop QR",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (ctx) => VendorShopScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/bag.png"),
                                      height: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "Add Product",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                          InkWell(
                              onTap: () async {
                                authstate state =
                                    Provider.of<authstate>(context, listen: false);
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text("Log Out"),
                                    content:
                                        const Text("Are you sure you want to log out?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('CANCEL'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          state.logout();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, '/', (_) => false);
                                        },
                                        child: const Text('LOG OUT'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Image(
                                      image: AssetImage("assets/icons/logout.png"),
                                      height: 25,color: Color(0xFFFFFFFF)),
                                  SizedBox(width: 10),
                                  Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ]),
                              )),
                          Divider(thickness: 1,color: Color(0xFFFFFFFF).withOpacity(0.25)),
                        ]
                      )
                    )
                ]
              ),
              Positioned(
                bottom:1,
                child:Image(
                  image: AssetImage("assets/icons/drawer-logo.png"),
                  height:MediaQuery.of(context).size.height*0.3),
              ),
            ]
          ));
    }
  }
}
