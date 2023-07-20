import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/data/models/offer.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/offer_state.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/modules/scan/widgets/scan_item_card.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/scan/ui/qr_code.dart';
import 'package:provider/provider.dart';

class ScanListScreen extends StatefulWidget {
  const ScanListScreen(
      {Key? key,
      required this.store_id,
      required this.ps,
      this.product,
      this.store})
      : super(key: key);

  final String? store_id;
  final ProductState? ps;
  final Product? product;
  final Store? store;

  @override
  _ScanListScreenState createState() => _ScanListScreenState();
}

class _ScanListScreenState extends State<ScanListScreen> {
  @override
  Widget build(BuildContext context) {
    Iterable<Product> products = widget.ps!.products.where((prod) {
      if (prod.offers != null) {
        return true;
      } else {
        return false;
      }
    });
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEDF3F6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15BBBA),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => QRCodeScreen(
                        product: widget.product,
                        store: widget.store,
                      )));
            },
            child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
        title: Text(
          "Claim Offer Products",
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)),
        ),
        actions:[
          InkWell(
            onTap: () {},
            child: Icon(Icons.search, color: Color(0xFFFFFFFF))),
        ]
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ScanItemCard(
              product: products.elementAt(index),
            );
          },
          // children: [
          //   Container(
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          //     child: Column(
          //       children: [
          //         // ScanItemCard(),
          //         // ScanItemCard(),
          //         // ScanItemCard(),
          //         // ScanItemCard(),
          //         // ScanItemCard(),
          //         // ScanItemCard(),
          //       ],
          //     ),
          //   )
          // ],
        ),
      ),
    ));
  }
}
