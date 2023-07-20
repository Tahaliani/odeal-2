import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/modules/radar/widgets/product_card.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:o_deal/modules/radar/ui/single_store.dart';
import 'package:o_deal/modules/scan/ui/qr_code.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen(
      {Key? key, required this.product, required this.store})
      : super(key: key);

  final Product product;
  final Store store;

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => SingleStoreScreen(
                        store: widget.store,
                      )));
            },
            child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
        title: Text(
          widget.product!.name,
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Container(
          child: Stack(children: [
        ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(children: [
                Container(
                  height: 142,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.product!.image.toString()),
                      colorFilter: ColorFilter.mode(
                          Color(0xFF000000).withOpacity(0.5),
                          BlendMode.srcOver),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rs: " + widget.product!.price.toString() + "/-",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF)),
                        )
                      ]),
                ),
                SizedBox(height: 18),
                SizedBox(
                  height: 57,
                  width: MediaQuery.of(context).size.width,
                  child: ODButton(
                    disabled: false,
                    title: "Buy 1 get 1 Free For Sunday",
                    onTap: () {},
                    prefixIconImage: Image(
                        image: AssetImage("assets/icons/offer.png"),
                        height: 25,
                        color: Color(0xFFFFFFFF)),
                    titleColor: const Color(0xFFFFFFFF),
                    buttonBackgroundColor: const Color(0xFFCB212E),
                    borderColor: const Color(0xFFFFFF),
                    borderRadius: 8,
                    titleFontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    child: Text(
                  widget.product!.description.toString(),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF333333)),
                )),
              ]))
        ]),
        Positioned(
          bottom: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 57,
            width: MediaQuery.of(context).size.width,
            child: ODButton(
              disabled: false,
              title: "scan to claim the offer",
              onTap: () {
                print("kj");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => QRCodeScreen(
                          product: widget.product,
                          store: widget.store,
                        )));
              },
              titleColor: const Color(0xFFFFFFFF),
              buttonBackgroundColor: const Color(0xFF1F1F1F),
              borderColor: const Color(0xFFFFFF),
              borderRadius: 8,
              titleFontSize: 18,
            ),
          ),
        ),
      ])),
    ));
  }
}
