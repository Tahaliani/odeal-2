import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/vendor/shop/ui/all_products.dart';
import 'package:o_deal/modules/vendor/shop/ui/add_product.dart';

class DeleteProductScreen extends StatefulWidget {
  const DeleteProductScreen({Key? key}) : super(key: key);

  @override
  _DeleteProductScreenState createState() => _DeleteProductScreenState();
}

class _DeleteProductScreenState extends State<DeleteProductScreen> {
  @override
  Widget build(BuildContext context) {
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
                            image: AssetImage("assets/icons/delete.png"),color:Color(0xFFFFFFFF),
                            height: 100)),
                    SizedBox(height: 30),
                    Text(
                      "Are you sure To delete this Product ?",
                      textAlign:TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 48,
                          width: MediaQuery.of(context).size.width*0.4,
                          child: ODButton(
                            disabled: false,
                            title: "Yes",
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => AllProductScreen()));
                            },
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFF1F1F1F),
                            borderColor: const Color(0xFFFFFF),
                            leadingIcon:Icon(Icons.done,color:Color(0xFFFFFFFF)),
                            borderRadius: 10,
                            titleFontSize: 15,
                          ),
                        ),
                        SizedBox(width:8),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 48,
                          width: MediaQuery.of(context).size.width*0.4,
                          child: ODButton(
                            disabled: false,
                            title: "No",
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => AddProductScreen()));
                            },
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFF1F1F1F),
                            borderColor: const Color(0xFFFFFF),
                            leadingIcon:Icon(Icons.close,color:Color(0xFFFFFFFF)),
                            borderRadius: 10,
                            titleFontSize: 15,
                          ),
                        ),
                      ]
                    ),
                  ]))
            ])));
  }
}
