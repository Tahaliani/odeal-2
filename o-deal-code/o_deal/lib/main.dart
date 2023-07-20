import 'package:o_deal/core/data/notifiers/providers.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/modules/authentication/ui/verification.dart';
import 'package:o_deal/modules/loop_screens/ui/loop_screens.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/selection/ui/user_vendor_selection.dart';
import 'package:o_deal/modules/splash/ui/splash.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'core/data/notifiers/auth_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  bool isLogged = false;
  bool showLoop = true;
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void getSharedpreferrence() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    SharedPreferences sh1 = await SharedPreferences.getInstance();
    bool? showLoopBool = sh1.getBool("showLoop");
    if (showLoopBool != null) {
      showLoop = showLoopBool;
    }
    // setState(() {
    //   checklog = sh1.getBool("logged")!;

    // print(showLoop);
    //   // print("Setting pref");
    // });
  }

  // @override
  // void afterFirstLayout(BuildContext context) => getSharedpreferrence();

  @override
  Widget build(BuildContext context) {
    getSharedpreferrence();
    return MultiProvider(
      providers: provider,
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'O\'Deal',
        theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
        debugShowCheckedModeBanner: false,
        home: Consumer<authstate>(
          builder: (context, state, child) {
            return state.isLoaded
                ? state.IsLoggedIn
                    ? state.verification
                        ? state.user.preferences.data.containsKey("type")
                            ? state.user.preferences.data["type"] == "vendor"
                                ? const DashboardScreen()
                                : const RadarScreen()
                            : const UserVendorSelection()
                        : const VerificationScreen()
                    : const LoopScreen()
                : const SplashScreen();
          },
        ),
        onGenerateRoute: Routing.allRoutes,
      ),
    );
  }
}
