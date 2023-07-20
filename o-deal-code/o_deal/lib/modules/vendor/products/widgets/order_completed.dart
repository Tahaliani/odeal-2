import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/data/models/order.dart';
import 'package:o_deal/modules/vendor/products/ui/order_id.dart';

class OrderCompleted extends StatefulWidget {
  const OrderCompleted({
    Key? key,
    required this.order,
  }) : super(key: key);

  final order;
  @override
  State<OrderCompleted> createState() => _OrderCompletedState();
}

class _OrderCompletedState extends State<OrderCompleted> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => OrderIdScreen(
                  order: widget.order,
                )));
      },
      child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFFFFFFF)),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                        image: NetworkImage(widget.order.product != null
                            ? widget.order.product.image
                            : ""),
                        fit: BoxFit.cover,
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
                        height: 78)),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Order#: " + widget.order.id,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1F1F)),
                  ),
                  Text(
                    widget.order.created_on,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFB4B4B4)),
                  ),
                  Text(
                    "Status: " + widget.order.payment_status,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF00C637)),
                  ),
                ])
              ]))),
    );
  }
}
