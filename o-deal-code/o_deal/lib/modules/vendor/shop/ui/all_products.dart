import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/vendor/shop/widgets/item_card.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:o_deal/modules/vendor/shop/ui/edit_product.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  Color _containerColor = Colors.white;

  bool isFetched = false;
  fetchProducts(ProductState ps, context) {
    if (!isFetched) {
      ps.getProducts(Provider.of<StoreState>(context).store!, context);
      isFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductState ps = Provider.of<ProductState>(context);
    fetchProducts(ps, context);
    List<Product> products = ps.products;
    // print(products);
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
                    MaterialPageRoute(builder: (ctx) => DashboardScreen()));
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            "All Products",
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
          actions:[
            InkWell(
              onTap: () {},
              child: Icon(Icons.more_vert)),
            SizedBox(width:10),
          ]
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GridView.builder(
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height * 0.6),
            ),
            itemCount: products.length,
            itemBuilder: ((BuildContext context, index) {
              return ItemCard(
                product: products[index],
              );
            }),
            // crossAxisCount: 2,
            // childAspectRatio: MediaQuery.of(context).size.width /
            //     (MediaQuery.of(context).size.height * 0.601),
            // crossAxisSpacing: 12.0,
            // mainAxisSpacing: 12.0,
            // shrinkWrap: true,
            //     children: [
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(
            //               builder: (ctx) => EditProductScreen()));
            //     },
            //     child: ItemCard(),
            //   ),
            // ]
          ),
          // SizedBox(height: 20),
        ),
      ),
    );
  }
}
