import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/vendor/shop/widgets/item_card.dart';
import 'package:o_deal/core/navigation/routing.dart';

import 'package:provider/provider.dart';

class VendorShopScreen extends StatefulWidget {
  const VendorShopScreen({Key? key}) : super(key: key);

  @override
  _VendorShopScreenState createState() => _VendorShopScreenState();
}

class _VendorShopScreenState extends State<VendorShopScreen> {
  bool isFetched = false;
  fetchProducts(StoreState ss, ProductState ps, context) {
    if (!isFetched) {
      setState(() {
        ps.getProducts(ss.store!, context);
        isFetched = true;
        nameController.text = ss.store!.name.toString();
        addressController.text = ss.store!.address.toString();
        phoneController.text = ss.store!.contact.toString();
        categoryController.text = ss.store!.category.toString();
      });
    }
  }

  Color _containerColor = Colors.white;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StoreState ss = Provider.of<StoreState>(context);
    ProductState ps = Provider.of<ProductState>(context);
    fetchProducts(ss, ps, context);
    List<Product> products = ps.products;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEDF3F6),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.29),
          child:Container(
            padding:EdgeInsets.symmetric(vertical:20,horizontal:10),
            height:MediaQuery.of(context).size.height*0.29,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
              image: DecorationImage(
                    image:AssetImage('assets/images/vendor-shop.png'), 
                    // NetworkImage(
                    //   ss.store != null
                    //       ? ss.store!.decoration_image.toString()
                    //       : "",
                    // ),
                    fit: BoxFit.cover,
                  )
            ),
            child:Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.dashboard, (_) => false);
              },
              child: Icon(Icons.arrow_back,color:Color(0xFF1F1F1F),size:30)),
                InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.dashboard, (_) => false);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image(
                    image: AssetImage(
                        "assets/images/vendor-profile.png"),
                    fit: BoxFit.cover,
                    height: 30,width:30)),),
              ]
            )
          )
        ),
        // AppBar(
        //   toolbarHeight: MediaQuery.of(context).size.height*0.3,
        //   elevation: 0,
        //   // centerTitle: true,
        //   flexibleSpace: Image(
        //     image: AssetImage('assets/images/vendor-shop.png'),
        //     fit: BoxFit.cover,
        //   ),
        //  
        // backgroundColor: Colors.transparent,
        //   leading: InkWell(
        //       onTap: () {
        //         Navigator.of(context)
        //             .pushNamedAndRemoveUntil(Routes.dashboard, (_) => false);
        //       },
        //       child: Icon(Icons.arrow_back)),
        //   // title: Text(
        //   //   ss.store != null ? ss.store!.name.toString() : "Store name",
        //   //   style: GoogleFonts.poppins(
        //   //       fontSize: 22,
        //   //       fontWeight: FontWeight.w600,
        //   //       color: Color(0xFFFFFFFF)),
        //   // ),
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              //   height: 160,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //         ss.store != null
              //             ? ss.store!.decoration_image.toString()
              //             : "",
              //       ),
              //     ),
              //   ),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Image(
              //         image: NetworkImage(
              //             ss.store != null ? ss.store!.image.toString() : ""),
              //         height: 50,
              //         loadingBuilder: (context, child, loadingProgress) {
              //           if (loadingProgress == null) {
              //             return child;
              //           }
              //           return Center(
              //             child: CircularProgressIndicator(
              //               value: loadingProgress.expectedTotalBytes != null
              //                   ? loadingProgress.cumulativeBytesLoaded /
              //                       loadingProgress.expectedTotalBytes!
              //                   : null,
              //             ),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10),

              TextFormField(
                style:GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F1F1F)),
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ), // Text(
              //   ss.store != null ? ss.store!.name.toString() : "Store name",
              //   style: GoogleFonts.poppins(
              //       fontSize: 18,
              //       fontWeight: FontWeight.w500,
              //       color: Color(0xFF1F1F1F)),
              // ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.location_on, color: Color(0xFFCB212E)),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F1F1F)),
                      controller: addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Text(
                  //   ss.store != null
                  //       ? ss.store!.address.toString()
                  //       : "Store address",
                  //   style: GoogleFonts.poppins(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500,
                  //       color: Color(0xFF1F1F1F)),
                  // )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.phone, color: Color(0xFFCB212E)),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F1F1F)),
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Text(
                  //   ss.store != null
                  //       ? ss.store!.contact.toString()
                  //       : "Store contact",
                  //   style: GoogleFonts.poppins(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500,
                  //       color: Color(0xFF1F1F1F)),
                  // )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ImageIcon(AssetImage("assets/icons/tag.png"),
                      size: 20, color: Color(0xFFCB212E)),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F1F1F)),
                      controller: categoryController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Text(
                  //   ss.store != null
                  //       ? ss.store!.category.toString()
                  //       : "Store category",
                  //   style: GoogleFonts.poppins(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500,
                  //       color: Color(0xFF1F1F1F)),
                  // )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:() async {
                      ss.updateStore(ss.store!.id.toString(), {
                        "name": nameController.text,
                        "address": addressController.text,
                        "contact": phoneController.text,
                        "category": categoryController.text,
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        //  height:164,
                        //  width:164,
                        decoration: BoxDecoration(
                          color: Color(0xFFCB212E).withOpacity(0.20),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Image(image:AssetImage('assets/icons/home.png'),height:34,color: Color(0xFFCB212E)),
                          SizedBox(height: 12),
                          Text(
                            "Save Store",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCB212E)),
                          ),
                        ]
                      )
                    )
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.addProduct, (_) => false);
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        //  height:164,
                        //  width:164,
                        decoration: BoxDecoration(
                          color: Color(0xFFCB212E).withOpacity(0.20),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Image(image:AssetImage('assets/icons/product-icon.png'),height:34,color: Color(0xFFCB212E)),
                          SizedBox(height: 12),
                          Text(
                            "Add Products",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCB212E)),
                          ),
                        ]
                      )
                    )
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.createOffer, (_) => false);
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        //  height:164,
                        //  width:164,
                        decoration: BoxDecoration(
                          color: Color(0xFFCB212E).withOpacity(0.20),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Image(image:AssetImage('assets/icons/gift.png'),height:34,color: Color(0xFFCB212E)),
                          SizedBox(height: 12),
                          Text(
                            "Create Offer",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCB212E)),
                          ),
                        ]
                      )
                    )
                  ),
                  
                ],
              ),
              
              SizedBox(height: 30),
              Text(
                "Our Products:",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000)),
              ),
              SizedBox(height: 10),
              Container(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  // crossAxisCount: 2,
                  // childAspectRatio: MediaQuery.of(context).size.width /
                  //     (MediaQuery.of(context).size.height * 0.601),
                  // crossAxisSpacing: 12.0,
                  // mainAxisSpacing: 12.0,
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height * 0.771),
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCard(product: products[index]);
                  },
                  // children: [
                  //   // ItemCard(),
                  //   // ItemCard(),
                  //   // ItemCard(),
                  //   // ItemCard(),
                  //   // ItemCard(),
                  //   // ItemCard(),
                  // ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
