import 'package:o_deal/data/notifiers/offer_state.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/modules/authentication/ui/signup_successful.dart';
import 'package:o_deal/modules/orders/ui/orders_screen.dart';
import 'package:o_deal/modules/setting/ui/setting_screen.dart';
import 'package:o_deal/modules/splash/ui/splash.dart';
import 'package:o_deal/modules/welcome/ui/welcome_screen.dart';
import 'package:o_deal/modules/authentication/ui/signup.dart';
import 'package:o_deal/modules/authentication/ui/login.dart';
import 'package:o_deal/modules/authentication/ui/verification.dart';
import 'package:o_deal/modules/authentication/ui/login_successful.dart';
import 'package:o_deal/modules/selection/ui/user_vendor_selection.dart';
import 'package:o_deal/modules/selection/ui/interest_selection.dart';
import 'package:o_deal/modules/loop_screens/ui/loop_screens.dart';
import 'package:o_deal/modules/radar/ui/radar_screen.dart';
import 'package:o_deal/modules/radar/ui/store_list.dart';
import 'package:o_deal/modules/radar/ui/review.dart';
import 'package:o_deal/modules/radar/ui/range_selector.dart';
import 'package:o_deal/modules/radar/ui/single_product.dart';
import 'package:o_deal/modules/radar/ui/single_store.dart';
import 'package:o_deal/modules/payment/ui/payment_successful.dart';
import 'package:o_deal/modules/payment/ui/payment_denied.dart';
import 'package:o_deal/modules/scan/ui/qr_code.dart';
import 'package:o_deal/modules/scan/ui/item_list.dart';
import 'package:o_deal/modules/vendor/dashboard/ui/dashboard_screen.dart';
import 'package:o_deal/modules/vendor/scan/ui/vendor_qr.dart';
import 'package:o_deal/modules/vendor/profile/ui/profile_screen.dart';
import 'package:o_deal/modules/vendor/products/ui/order_list.dart';
import 'package:o_deal/modules/vendor/products/ui/order_id.dart';
import 'package:o_deal/modules/vendor/shop/ui/vendor_shop_screen.dart';
import 'package:o_deal/modules/vendor/shop/ui/all_products.dart';
import 'package:o_deal/modules/vendor/shop/ui/add_product.dart';
import 'package:o_deal/modules/vendor/shop/ui/edit_product.dart';
import 'package:o_deal/modules/vendor/shop/ui/create_offer.dart';
import 'package:o_deal/modules/vendor/shop/ui/delete_product.dart';
import 'package:flutter/material.dart';

part 'routes.dart';

class Routing {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);
      case Routes.welcome:
        return MaterialPageRoute(
            builder: (_) => const WelcomeScreen(), settings: settings);
      case Routes.signup:
        return MaterialPageRoute(
            builder: (_) => const SignupScreen(), settings: settings);
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(), settings: settings);
      case Routes.loginSuccessful:
        return MaterialPageRoute(
            builder: (_) => const LoginSuccessfulScreen(), settings: settings);
      case Routes.signupSuccessful:
        return MaterialPageRoute(
            builder: (_) => const SignupSuccessfulScreen(), settings: settings);
      case Routes.verification:
        return MaterialPageRoute(
            builder: (_) => const VerificationScreen(), settings: settings);
      case Routes.userVendorSelection:
        return MaterialPageRoute(
            builder: (_) => const UserVendorSelection(), settings: settings);
      case Routes.loopScreens:
        return MaterialPageRoute(
            builder: (_) => const LoopScreen(), settings: settings);
      case Routes.radar:
        return MaterialPageRoute(
            builder: (_) => const RadarScreen(), settings: settings);
      case Routes.storeList:
        return MaterialPageRoute(
            builder: (_) => const StoreListScreen(), settings: settings);
      // case Routes.review:
      //   return MaterialPageRoute(
      //       builder: (_) => const ReviewScreen(store: null,), settings: settings);
      case Routes.rangeSelector:
        return MaterialPageRoute(
            builder: (_) => const RangeSelectorScreen(), settings: settings);
      // case Routes.singleProduct:
      //   return MaterialPageRoute(
      //       builder: (_) => const SingleProductScreen(), settings: settings);
      // case Routes.singleStore:
      //   return MaterialPageRoute(
      //       builder: (_) => const SingleStoreScreen(
      //             store: null,
      //           ),
      //       settings: settings);
      case Routes.ordersScreen:
        return MaterialPageRoute(
          builder: (_) => const OrdersScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(
            user: null,
          ),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case Routes.paymentSuccessful:
        return MaterialPageRoute(
            builder: (_) => const PaymentSuccessful(), settings: settings);
      case Routes.paymentDenied:
        return MaterialPageRoute(
            builder: (_) => const PaymentDenied(), settings: settings);
      case Routes.qrCode:
        return MaterialPageRoute(
            builder: (_) => const QRCodeScreen(
                  product: null,
                  store: null,
                ),
            settings: settings);
      case Routes.scanList:
        return MaterialPageRoute(
            builder: (_) => ScanListScreen(
                  store_id: '',
                  ps: ProductState(),
                ),
            settings: settings);
      case Routes.dashboard:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(), settings: settings);
      case Routes.vendorQR:
        return MaterialPageRoute(
            builder: (_) => const VendorQRCodeScreen(), settings: settings);
      case Routes.vendorProfile:
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen(
                  user: null,
                ),
            settings: settings);
      case Routes.orderList:
        return MaterialPageRoute(
            builder: (_) => const OrderListScreen(), settings: settings);
      case Routes.orderId:
        return MaterialPageRoute(
            builder: (_) => const OrderIdScreen(), settings: settings);
      case Routes.vendorShop:
        return MaterialPageRoute(
            builder: (_) => const VendorShopScreen(), settings: settings);
      case Routes.allProduct:
        return MaterialPageRoute(
            builder: (_) => const AllProductScreen(), settings: settings);
      case Routes.addProduct:
        return MaterialPageRoute(
            builder: (_) => const AddProductScreen(), settings: settings);
      case Routes.editProduct:
        return MaterialPageRoute(
            builder: (_) => EditProductScreen(
                  product: null,
                ),
            settings: settings);
      case Routes.createOffer:
        return MaterialPageRoute(
            builder: (_) => const CreateOfferScreen(), settings: settings);
      case Routes.deleteProduct:
        return MaterialPageRoute(
            builder: (_) => const DeleteProductScreen(), settings: settings);
      case Routes.interestSelection:
        return MaterialPageRoute(
            builder: (_) => const InterestSelectionScreen(),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);
    }
  }
}
