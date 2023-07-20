import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/modules/vendor/shop/widgets/item_card.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:provider/provider.dart';
import 'package:o_deal/data/notifiers/store_state.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Color _containerColor = Colors.white;

  TextEditingController nameController = TextEditingController();
  // late String? id;
  // late String storeId;
  TextEditingController priceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late String? image;
  late List<dynamic>? galery;
  late double? rating;

  @override
  Widget build(BuildContext context) {
    StoreState ss = Provider.of<StoreState>(context);
    authstate state = Provider.of<authstate>(context);
    ProductState ps = Provider.of<ProductState>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
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
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.vendorShop, (_) => false);
                  },
                  child: Icon(Icons.arrow_back)),
              title: Text(
                ss.store!.name.toString()+"-Add Product",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
            body: Container(
                child: ListView(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Tittle:",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 9),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF3F6),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            decoration: new InputDecoration.collapsed(
                              hintText: 'Product Name',
                              border: InputBorder.none,
                            ),
                            controller: nameController,
                            // initialValue: "Product Name",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1F1F1F)),
                          ),
                          //  Text(
                          //   "Product Name",
                          //   // widget.product!.name.toString(),
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w400,
                          //       color: Color(0xFF1F1F1F)),
                          // ),
                        ),
                        SizedBox(height: 20),
                        
                        // RichText(
                        //   text: TextSpan(
                        //     children: <TextSpan>[
                        //       TextSpan(
                        //           text: "Product Image: ",
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w500,
                        //               color: const Color(0xFF1F1F1F))),
                        //       TextSpan(
                        //           text: " (Max 5)",
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w400,
                        //               color: const Color(0xFF1F1F1F))),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Regular Price:",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F1F1F)),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      height: 46,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEDF3F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextFormField(
                                        decoration:
                                            new InputDecoration.collapsed(
                                          hintText: 'Regular Price',
                                          border: InputBorder.none,
                                        ),
                                        controller: priceController,
                                        // initialValue: "299.00",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1F1F1F)),
                                      ),
                                      // Text(
                                      //   "399.00",
                                      //   textAlign: TextAlign.start,
                                      //   style: GoogleFonts.poppins(
                                      //       fontSize: 15,
                                      //       fontWeight: FontWeight.w400,
                                      //       color: Color(0xFF1F1F1F)),
                                      // ),
                                    ),
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Offer Price:",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F1F1F)),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      height: 46,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEDF3F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextFormField(
                                        decoration:
                                            new InputDecoration.collapsed(
                                          hintText: 'Offer Price',
                                          border: InputBorder.none,
                                        ),
                                        controller: offerPriceController,
                                        // initialValue: "299.00",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1F1F1F)),
                                      ),
                                      //   Text(
                                      //     "299.00",
                                      //     textAlign: TextAlign.start,
                                      //     style: GoogleFonts.poppins(
                                      //         fontSize: 15,
                                      //         fontWeight: FontWeight.w400,
                                      //         color: Color(0xFF1F1F1F)),
                                      //   ),
                                    ),
                                  ]),
                            ]),
                        SizedBox(height: 20),
                        Text(
                          "Product Image:",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 10),
                        GridView.count(
                            physics: const ScrollPhysics(),
                            crossAxisCount: 3,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height * 0.5),
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 8.0,
                            shrinkWrap: true,
                            children: [
                              Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/border.png"))),
                            child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image:AssetImage("assets/icons/gallery.png"),height:30),
                                    SizedBox(height: 9),
                                    SizedBox(
                                      width:100,
                                      child:Text(
                                        "Add Product Gallery",
                                        textAlign:TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1F1F1F)),
                                      ),
                                    )
                                  ]
                                )
                              ),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-1.png")),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-2.png")),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-3.png")),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-4.png")),
                              const Image(
                                  image: AssetImage(
                                      "assets/images/product-5.png")),
                            ]),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: ODButton(
                            disabled: false,
                            title: "SAVE PRODUCT",
                            onTap: () async {
                              var data = {
                                "name": nameController.text,
                                "storeId": state.user.id,
                                "offerPrice": offerPriceController.text,
                                "price": priceController.text,
                                "description": descriptionController.text,
                                "galery": [],
                                "image":
                                    "https://endpoint.odeal.shop/v1/storage/buckets/63d3742e9ffbdc3bcd38/files/63d37bc1c81ea5bf84e0/preview?project=63be9eb7dd5fe7dbc4f1",
                                "rating": 5.0,
                              };
                              await ps.addProduct(ID.unique(), data, context);
                              Navigator.popAndPushNamed(
                                  context, Routes.vendorShop);
                            },
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFF1F1F1F),
                            borderColor: const Color(0xFFFFFF),
                            borderRadius: 10,
                            titleFontSize: 15,
                          ),
                        ),
                      ])),
              SizedBox(height: 20),
            ]))));
  }
}
