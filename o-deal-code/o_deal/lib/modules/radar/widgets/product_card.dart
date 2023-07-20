import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/data/models/product.dart';

class ProductCard extends StatefulWidget {
  // final Image image;

  const ProductCard({
    Key? key,
    required this.product,
    // required this.image,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // print(widget.product);
    return Padding(
        padding: EdgeInsets.only(right: 13),
        child: Container(
            height: 116,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.product.image!),
                colorFilter: ColorFilter.mode(
                    Color(0xFF000000).withOpacity(0.5), BlendMode.srcOver),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.product.name,
                    style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF)),
                  ),
                  Text(
                    "Rs: " + widget.product.price.toString() + "/-",
                    style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF)),
                  ),
                ])));
  }
}
