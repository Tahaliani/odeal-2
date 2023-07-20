import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:o_deal/modules/selection/widgets/selection_item.dart';
import 'package:o_deal/modules/selection/ui/interest_selection.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';

import '../../../core/data/notifiers/auth_state.dart';
import 'package:provider/provider.dart';

class UserVendorSelection extends StatefulWidget {
  const UserVendorSelection({Key? key}) : super(key: key);

  @override
  _UserVendorSelectionState createState() => _UserVendorSelectionState();
}

class _UserVendorSelectionState extends State<UserVendorSelection> {
  Color _containerColor = Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    authstate state = Provider.of<authstate>(context, listen: false);
    StoreState ss = Provider.of<StoreState>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            body: Stack(children: [
              // Positioned(
              //     bottom: 0,
              //     child: Image(
              //         image: AssetImage("assets/images/bg.png"),
              //         width: MediaQuery.of(context).size.width)),
              Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Select User Type",
                              style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1F1F1F)),
                            ),
                            SizedBox(height: 40),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await state.editAccount(null, null, null,
                                          null, {"type": "user"});
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  InterestSelectionScreen()));
                                    },
                                    child: IgnorePointer(
                                        child: SelectionItem(
                                            image: Image(
                                                image: AssetImage(
                                                    "assets/icons/person.png"),color:Color(0xFFCB212E),
                                                height: 63),
                                            text: "User")),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await state.editAccount(null, null, null,
                                          null, {"type": "vendor"});
                                      await ss.createStore(state.user.id);
                                      await Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (ctx) =>
                                                  DashboardScreen()));
                                    },
                                    child: IgnorePointer(
                                        child: SelectionItem(
                                            image: Image(
                                                image: AssetImage(
                                                    "assets/icons/vendor.png"),color:Color(0xFFCB212E),
                                                height: 63),
                                            text: "Vendor")),
                                  ),
                                ])
                          ])))
            ])));
  }
}
