import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/offer_state.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/radar/ui/single_product.dart';
import 'package:o_deal/modules/selection/widgets/selection_item.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/scan/ui/item_list.dart';
import 'package:provider/provider.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key, required this.product, required this.store})
      : super(key: key);

  final Product? product;
  final Store? store;

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  Color _containerColor = Colors.white;
  String? result = null;
  @override
  Widget build(BuildContext context) {
    ProductState ps = Provider.of<ProductState>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFEDF3F6),
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xFFEDF3F6),
              leading: InkWell(
                  onTap: () {
                    if (widget.product == null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => RadarScreen(),
                        ),
                      );
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => SingleProductScreen(
                            product: widget.product!,
                            store: widget.store!,
                          ),
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.arrow_back, color: Color(0xFFCB212E))),
              title: Text(
                "Scan QR Code",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000)),
              ),
            ),
            body: Stack(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                  child: Column(children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.photo_camera_outlined,
                                  color: Color(0xFFCB212E)),
                              Text(
                                "Please move your camera on the QR code",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF000000)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                // width: 200,
                                height: 175,
                                child: MobileScanner(
                                  controller: MobileScannerController(
                                    facing: CameraFacing.back,
                                  ),
                                  onDetect: ((barcode) {
                                    if (barcode.raw == null) {
                                      print('failed');
                                    } else {
                                      setState(() {
                                        result = barcode.raw!;
                                        // print(result);
                                      });
                                    }
                                  }),
                                ),
                              ),
                              // Image(
                              //     image: AssetImage("assets/images/code.png")),
                              SizedBox(height: 10),
                              Container(
                                //  padding:EdgeInsets.symmetric(horizontal:25),
                                height: 48,
                                width: MediaQuery.of(context).size.width,
                                child: ODButton(
                                  disabled: result == null ? true : false,
                                  leadingIcon: Icon(Icons.qr_code,
                                      color: Color(0xFFFFFFFF)),
                                  title: "scan QR CODE",
                                  onTap: () async {
                                    Store store = await Provider.of<StoreState>(
                                            context,
                                            listen: false)
                                        .getStore(result, context);

                                    await ps.getProducts(store, context);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) => ScanListScreen(
                                          product: widget.product,
                                          store: store,
                                          store_id: result.toString(),
                                          ps: ps,
                                        ),
                                      ),
                                    );
                                  },
                                  titleColor: const Color(0xFFFFFFFF),
                                  buttonBackgroundColor:
                                      const Color(0xFFCB212E),
                                  borderColor: const Color(0xFFFFFF),
                                  borderRadius: 10,
                                  titleFontSize: 15,
                                ),
                              ),
                            ]))
                  ]))
            ])));
  }
}
