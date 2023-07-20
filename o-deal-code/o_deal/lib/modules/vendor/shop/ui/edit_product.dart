import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/modules/vendor/shop/widgets/item_card.dart';
import 'package:o_deal/modules/vendor/shop/ui/all_products.dart';
import 'package:o_deal/modules/vendor/shop/ui/delete_product.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:provider/provider.dart';
// import 'package:popup_menu_title/popup_menu_title.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key, this.product}) : super(key: key);
  final Product? product;
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  Color _containerColor = Colors.white;

  TextEditingController nameController = TextEditingController();
  // late String? id;
  // late String storeId;
  TextEditingController priceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late String? image;
  late List<dynamic> galery = [];
  late double? rating;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product!.name.toString();
    priceController.text = widget.product!.price.toString();
    offerPriceController.text = widget.product!.offerPrice.toString();
    descriptionController.text = widget.product!.description.toString();
    if (widget.product!.galery!.length > 0) {
      galery = widget.product!.galery!;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => AllProductScreen()));
                  },
                  child: Icon(Icons.arrow_back)),
              title: Text(
                "Edit Product",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF)),
              ),
              actions: [
                PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: InkWell(
                          onTap:(){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => DeleteProductScreen()));
                          },
                          child:Row(
                            children: [
                              Icon(Icons.delete_outlined, color: Color(0xFFCB212E)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Delete Product",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF1F1F1F)),
                              ),
                            ],
                          )
                        ),
                      ),
                    ],
                    offset: Offset(0, 100),
                    color: Color(0xFFFFFFFF),
                    elevation: 2,
                  )
                
              ],
            ),
            body: Container(
                child: ListView(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Title:",
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
                          // Text(
                          //   widget.product!.name.toString(),
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 11,
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
                        // SizedBox(height:10),
                        // Container(
                        //   height: 146,
                        //   width: double.infinity,
                        //   padding: const EdgeInsets.all(1),
                        //   decoration: const BoxDecoration(
                        //     image: DecorationImage(
                        //       image: AssetImage("assets/images/border.png"),
                        //     ),
                        //   ),
                        //   child: Container(
                        //     clipBehavior: Clip.antiAlias,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Image(
                        //       fit: BoxFit.cover,
                        //       image: NetworkImage(
                        //         widget.product!.image.toString(),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 20),
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
                                        // initialValue: "Product Name",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1F1F1F)),
                                      ),
                                    ),
                                    //   Text(
                                    //     widget.product!.price.toString(),
                                    //     textAlign: TextAlign.start,
                                    //     style: GoogleFonts.poppins(
                                    //         fontSize: 15,
                                    //         fontWeight: FontWeight.w400,
                                    //         color: Color(0xFF1F1F1F)),
                                    //   ),
                                    // ),
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
                                        // initialValue: "Product Name",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1F1F1F)),
                                      ),
                                      // Text(
                                      //   widget.product!.offerPrice.toString(),
                                      //   textAlign: TextAlign.start,
                                      //   style: GoogleFonts.poppins(
                                      //       fontSize: 15,
                                      //       fontWeight: FontWeight.w400,
                                      //       color: Color(0xFF1F1F1F)),
                                      // ),
                                    ),
                                  ]),
                            ]),
                        SizedBox(height: 20),
                        Text(
                          "Description:",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 9),
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF3F6),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            decoration: new InputDecoration.collapsed(
                              hintText: 'Description',
                              border: InputBorder.none,
                            ),
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F),
                            ),

                            // initialValue:
                            //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          ),
                          // Text(
                          //   widget.product!.description.toString(),
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 11,
                          //       fontWeight: FontWeight.w400,
                          //       color: Color(0xFF1F1F1F)),
                          // ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Product Images",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 10),
                        // GridView.count(
                        //     physics: const ScrollPhysics(),
                        //     crossAxisCount: 3,
                        //     childAspectRatio:
                        //         MediaQuery.of(context).size.width /
                        //             (MediaQuery.of(context).size.height * 0.5),
                        //     crossAxisSpacing: 12.0,
                        //     mainAxisSpacing: 12.0,
                        //     shrinkWrap: true,
                        //     children:
                        //                                 // [
                        //     //   Image(
                        //     //     image:
                        //     //         AssetImage("assets/images/product-1.png"),
                        //     //   ),
                        //     //   Image(
                        //     //     image:
                        //     //         AssetImage("assets/images/product-2.png"),
                        //     //   ),
                        //     //   Image(
                        //     //     image:
                        //     //         AssetImage("assets/images/product-3.png"),
                        //     //   ),
                        //     //   Image(
                        //     //     image:
                        //     //         AssetImage("assets/images/product-4.png"),
                        //     //   ),
                        //     //   Image(
                        //     //     image:
                        //     //         AssetImage("assets/images/product-5.png"),
                        //     //   ),
                        //     //   Image(
                        //     //     image:
                        //     //         AssetImage("assets/images/product-6.png"),
                        //     //   ),
                        //     // ],
                        //     ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height * 0.5),
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                          ),
                          itemCount: galery.length,
                          itemBuilder: ((BuildContext context, index) {
                            print(galery[index]);
                            return Image(
                              image: NetworkImage(galery[index]),
                            );
                            return ItemCard(
                              product: galery[index],
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: ODButton(
                            disabled: false,
                            title: "UPDATE PRODUCT",
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
                              await ps.updateProduct(
                                  widget.product!.id.toString(), data, context);
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
