import 'package:o_deal/data/notifiers/helper_state.dart';
import 'package:o_deal/data/notifiers/offer_state.dart';
import 'package:o_deal/data/notifiers/order_state.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:o_deal/data/notifiers/review_state.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_state.dart';

List<SingleChildWidget> provider = [
  ChangeNotifierProvider(
    create: (context) => authstate(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => ProductState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => OfferState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => StoreState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => ReviewState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => OrderState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => HelperState(),
    lazy: false,
  ),
];
