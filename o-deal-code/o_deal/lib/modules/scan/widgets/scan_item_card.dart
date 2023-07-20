import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/data/models/offer.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/modules/payment/ui/payment_successful.dart';
import 'package:o_deal/modules/payment/ui/payment_denied.dart';

class ScanItemCard extends StatelessWidget {
  // final Image image;
  const ScanItemCard({
    Key? key,
    required this.product,
    // required this.image,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10)),
              child: Stack(
                alignment: Alignment.center,
                children:[
                  Positioned(
                    top:1,
                    child:Image(
                      image: AssetImage("assets/images/store-card-bg.png"),
                      height:MediaQuery.of(context).size.height*0.09),
                  ),
                  Column(children: [
                    SizedBox(height:30),
                    Image(image: NetworkImage(product.image!), height: 67),
                    SizedBox(width: 10),
                    Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Text(
                        product.name,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F1F1F)),
                      ),
                      Text(
                        "Rs: ${product.price}/-",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                      SizedBox(
                        height: 30,
                        // width:MediaQuery.of(context).size.width*0.25,
                        child: ODButton(
                          disabled: false,
                          title: "Claim offer",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            PaymentSuccessful(),
                      ),
                    );
                          },
                          prefixIconImage:Image(
                           image: AssetImage("assets/icons/gift.png"),height:15),
                          titleColor: const Color(0xFFCB212E),
                          buttonBackgroundColor: const Color(0xFFFFFF),
                          borderColor: const Color(0xFFFFFF),
                          borderRadius: 5,
                          titleFontSize: 12,
                        ),
                      ),
                    ])
                  ]),
            ]
          )),
    );
  }
}
