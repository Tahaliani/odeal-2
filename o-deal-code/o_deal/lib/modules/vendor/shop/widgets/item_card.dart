import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/modules/vendor/shop/ui/edit_product.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => EditProductScreen(
                  product: widget.product,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFFF), borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Container(
              // padding:EdgeInsets.symmetric(vertical:10),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child:Image(
                      image: NetworkImage(widget.product.image != null
                          ? widget.product.image.toString()
                          : ""),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      height: 114
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.product.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333)),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.product.price.toString() + " ₹",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 12,
                                decoration: widget.product.offerPrice != null ||
                                        widget.product.offerPrice == 0
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Visibility(
                              visible: widget.product.offerPrice != null ||
                                  widget.product.offerPrice == 0,
                              child: Text(
                                widget.product.offerPrice.toString() + " ₹",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000000)),
                              ),
                            ),
                            SizedBox(width:4),
                            RatingBar.builder(
                              wrapAlignment: WrapAlignment.spaceEvenly,
                              initialRating: widget.product.rating!.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 10,
                              itemCount: widget.product.rating!.toInt(),
                              // itemPadding:
                              //     EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       height: 20,
                        //       // width: MediaQuery.of(context).size.width * 0.4,
                        //       child: ODButton(
                        //         disabled: false,
                        //         title: "Buy Now",
                        //         onTap: () {},
                        //         titleColor: const Color(0xFFFFFFFF),
                        //         buttonBackgroundColor: const Color(0xFF1A6A8F),
                        //         borderColor: const Color(0xFFFFFF),
                        //         borderRadius: 3,
                        //         titleFontSize: 9,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [

                        //     Icon(Icons.star,
                        //         color: Color(0xFFF9B401), size: 15),
                        //     Icon(Icons.star,
                        //         color: Color(0xFFF9B401), size: 15),
                        //     Icon(Icons.star,
                        //         color: Color(0xFFF9B401), size: 15),
                        //     Text(
                        //       widget.product.rating.toString(),
                        //       style: GoogleFonts.poppins(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w300,
                        //           color: Color(0xFF000000)),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //TODO Check if offer available
            Visibility(
              visible: widget.product.activeOffer != true ? true : false,
              child: Positioned(
                left: 16,
                child: Container(
                  height: 27,
                  width: 26,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF0000),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(3.0),
                      bottomRight: Radius.circular(3.0),
                    ),
                  ),
                  child: Text(
                    "${widget.product.price.toInt() - widget.product.offerPrice!.toInt()} OFF",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
