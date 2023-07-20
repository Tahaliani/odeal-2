import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/helper_state.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/radar/widgets/store_card.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/radar/ui/single_store.dart';
import 'package:provider/provider.dart';

class StoreListScreen extends StatefulWidget {
  const StoreListScreen({Key? key}) : super(key: key);

  @override
  _StoreListScreenState createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  bool isFetched = false;
  fetchStores(StoreState ps, context) {
    if (!isFetched) {
      ps.getStores(context);
      isFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    StoreState ps = Provider.of<StoreState>(context);
    // fetchStores(ps, context);
    List<Store> stores = ps.stores;
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
                    MaterialPageRoute(builder: (ctx) => RadarScreen()));
              },
              child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
          title: Text(
            "Food Store",
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child:GridView.builder(  
              itemCount: stores.length,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  crossAxisSpacing: 10.0,  
                  mainAxisSpacing: 10.0,  
                  childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height/1.7),

              ),  
              itemBuilder: ((BuildContext context, index) {
              return InkWell(
                onTap: () {
                  {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            SingleStoreScreen(store: stores[index]),
                      ),
                    );
                  }
                },
                child: StoreCard(
                  store: stores[index],
                ),
              );
            }),  
            ),
          //  ListView.builder(
          //   itemCount: stores.length,
          //   itemBuilder: ((BuildContext context, index) {
          //     return InkWell(
          //       onTap: () {
          //         {
          //           Navigator.of(context).pushReplacement(
          //             MaterialPageRoute(
          //               builder: (ctx) =>
          //                   SingleStoreScreen(store: stores[index]),
          //             ),
          //           );
          //         }
          //       },
          //       child: StoreCard(
          //         store: stores[index],
          //       ),
          //     );
          //   }),
          //   // Column(
          //   //   children: [
          //   //     InkWell(
          //   //         onTap: () {
          //   //           Navigator.of(context).pushReplacement(
          //   //               MaterialPageRoute(
          //   //                   builder: (ctx) => SingleStoreScreen()));
          //   //         },
          //   //         child: StoreCard()),
          //   //     InkWell(
          //   //         onTap: () {
          //   //           Navigator.of(context).pushReplacement(
          //   //               MaterialPageRoute(
          //   //                   builder: (ctx) => SingleStoreScreen()));
          //   //         },
          //   //         child: StoreCard()),
          //   //     InkWell(
          //   //         onTap: () {
          //   //           Navigator.of(context).pushReplacement(
          //   //               MaterialPageRoute(
          //   //                   builder: (ctx) => SingleStoreScreen()));
          //   //         },
          //   //         child: StoreCard()),
          //   //     InkWell(
          //   //         onTap: () {
          //   //           Navigator.of(context).pushReplacement(
          //   //               MaterialPageRoute(
          //   //                   builder: (ctx) => SingleStoreScreen()));
          //   //         },
          //   //         child: StoreCard()),
          //   //     InkWell(
          //   //         onTap: () {
          //   //           Navigator.of(context).pushReplacement(
          //   //               MaterialPageRoute(
          //   //                   builder: (ctx) => SingleStoreScreen()));
          //   //         },
          //   //         child: StoreCard()),
          //   //   ],
          // ),
        ),
      ),
    );
  }
}
