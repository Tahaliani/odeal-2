import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/modules/radar/ui/review.dart';
import 'package:o_deal/modules/radar/widgets/product_card.dart';
import 'package:o_deal/modules/radar/ui/store_list.dart';
import 'package:o_deal/modules/radar/ui/single_product.dart';
import 'package:o_deal/modules/radar/ui/single_store.dart';
import 'package:provider/provider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:o_deal/modules/radar/widgets/review_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleStoreScreen extends StatefulWidget {
  const SingleStoreScreen({Key? key, required this.store}) : super(key: key);
  final Store store;
  @override
  _SingleStoreScreenState createState() => _SingleStoreScreenState();
}

class _SingleStoreScreenState extends State<SingleStoreScreen> {
  bool isFetched = false;
  fetchProducts(ProductState ps, context) async {
    if (!isFetched && mounted) {
      // print("Dddd");
      await ps.getProducts(widget.store, context);

      // print(ps.products.length);
      setState(() {
        isFetched = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductState ps = Provider.of<ProductState>(context);
    fetchProducts(ps, context);
    List<Product> products = ps.products;
    // print("ddd");
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => StoreListScreen()));
              },
              child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
          title: Text(
            widget.store!.name,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.48,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image(
                          image: NetworkImage(widget.store!.decoration_image!),
                          width: MediaQuery.of(context).size.width,
                          // fit: BoxFit.cover,
                          height: 164),
                    ),
                    Positioned(
                        bottom: 1,
                        left: MediaQuery.of(context).size.width * 0.07,
                        child: Row(children: [
                          SizedBox(
                            height: 33,
                            width: MediaQuery.of(context).size.width * 0.37,
                            child: ODButton(
                              disabled: false,
                              title: "Directions",
                              onTap: () {},
                              leadingIcon: Icon(Icons.location_on,
                                  size: 15, color: Color(0xFFFFFFFF)),
                              titleColor: const Color(0xFFFFFFFF),
                              buttonBackgroundColor: const Color(0xFF1F1F1F),
                              borderColor: const Color(0xFFFFFF),
                              borderRadius: 5,
                              titleFontSize: 12,
                            ),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            height: 34,
                            width: MediaQuery.of(context).size.width * 0.37,
                            child: ODButton(
                              disabled: false,
                              title: "Call Now",
                              onTap: () {},
                              leadingIcon: Icon(Icons.phone,
                                  size: 15, color: Color(0xFFFFFFFF)),
                              titleColor: const Color(0xFFFFFFFF),
                              buttonBackgroundColor: const Color(0xFFCB212E),
                              borderColor: const Color(0xFFFFFF),
                              borderRadius: 5,
                              titleFontSize: 12,
                            ),
                          ),
                        ]))
                  ])),
              SizedBox(height: 20),
              Container(
                  child: Row(children: [
                Image(
                  image: NetworkImage(widget.store!.image!),
                  height: 58,
                ),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    widget.store!.name,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1F1F)),
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () {
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
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (ctx) => ReviewScreen(store: widget.store)));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                wrapAlignment: WrapAlignment.start,
                                initialRating:
                                    widget.store!.reviews!.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 16,
                                itemCount: widget.store!.reviews!.toInt(),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 6,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          Text(
                            "${widget.store!.reviews} Review",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1F1F1F)),
                          ),
                        ]),
                  ),
                ])
              ])),
              SizedBox(height: 20),
              Container(
                child: Text(
                  widget.store!.description!,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer's Products",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F1F1F)),
                    ),
                    SizedBox(height: 13),
                    Container(
                      height: 120,
                      child: InkWell(
                        onTap:(){},
                        child:ListView.builder(
                          itemCount: products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => SingleProductScreen(
                                      product: products[index],
                                      store: widget.store,
                                    ),
                                  ),
                                );
                              },
                              child: ProductCard(
                                product: products[index],
                              ),
                            );
                          },
                          // children: [
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          //   InkWell(
                          //       onTap: () {
                          //         Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (ctx) =>
                          //                     SingleProductScreen()));
                          //       },
                          //       child: ProductCard()),
                          // ],
                        ),
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
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
          child: ListView(children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    "Store Reviews",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1F1F)),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child:Icon(Icons.close,size: 25, color: Color(0xFF1F1F1F)),
                  ),
                ]
              ),
              SizedBox(height:20),
                Container(
                  padding:EdgeInsets.symmetric(horizontal:15,vertical:15),
                  decoration: BoxDecoration(
                    color: Color(0xFFCB212E).withOpacity(0.30),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                  Text(
                    "Overall Rating",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFCB212E)),
                  ),
                  SizedBox(width:10),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(
                      "4.2 ",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFCB212E)),
                    ),
                    RatingBar(
                        initialRating: 4,
                        minRating: 4,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18.0,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star,
                                color: Color(0xFFFFFFFF), size: 15),
                            half: const Icon(Icons.star_half,
                                color: Color(0xFFFFFFFF), size: 15),
                            empty: const Icon(Icons.star_outline,
                                color: Color(0xFFFFFFFF), size: 15)),
                        onRatingUpdate: (value) {}),
                    const SizedBox(width: 3),
                  ]),
                ])
              ),
              SizedBox(height: 20),
              ReviewWidget(),
              ReviewWidget(),
              ReviewWidget(),
              ReviewWidget(),
            ]))
      ])),
    );
  }
  Widget _buildBottomSheet2(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
          child: ListView(children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    "Store Reviews",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1F1F)),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child:Icon(Icons.close,size: 25, color: Color(0xFF1F1F1F)),
                  ),
                ]
              ),
              SizedBox(height:20),
                Container(
                  padding:EdgeInsets.symmetric(horizontal:15,vertical:15),
                  decoration: BoxDecoration(
                    color: Color(0xFFCB212E).withOpacity(0.30),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                  Text(
                    "Overall Rating",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFCB212E)),
                  ),
                  SizedBox(width:10),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(
                      "4.2 ",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFCB212E)),
                    ),
                    RatingBar(
                        initialRating: 4,
                        minRating: 4,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18.0,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star,
                                color: Color(0xFFFFFFFF), size: 15),
                            half: const Icon(Icons.star_half,
                                color: Color(0xFFFFFFFF), size: 15),
                            empty: const Icon(Icons.star_outline,
                                color: Color(0xFFFFFFFF), size: 15)),
                        onRatingUpdate: (value) {}),
                    const SizedBox(width: 3),
                  ]),
                ])
              ),
              SizedBox(height: 20),
              ReviewWidget(),
              ReviewWidget(),
              ReviewWidget(),
              ReviewWidget(),
            ]))
      ])),
    );
  }
}
