import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:o_deal/core/env/AppCred.dart';
import 'package:o_deal/data/models/order.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/product_state.dart';
import 'package:provider/provider.dart';

class OrderState extends ChangeNotifier {
  final String collectionId = "63ce5eec7d61c9dd3f5d";
  Client client = Client();
  late Databases db;
  List<Order> orders = [];

  OrderState() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId); //
    db = Databases(client);
  }

  getOrder(String orderId) {}

  getOrders(String store_id, BuildContext context) async {
    // print("gettin");
    try {
      var res = await db.listDocuments(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          queries: [Query.equal("store_id", store_id)]);

      // print(res);
      // print(res.documents);
      orders = res.documents.map((gl) => Order.fromJson(gl.data)).toList();

      ProductState ps = ProductState();

      for (var order in orders) {
        await ps.getProduct(order.product_id);
        order.product = ps.product;
      }

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  getCustomerOrders(String customer_id, BuildContext context) async {
    // print("gettin");
    try {
      var res = await db.listDocuments(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          queries: [Query.equal("customer_id", customer_id)]);

      // print(res);
      // print(res.documents);
      orders = res.documents.map((gl) => Order.fromJson(gl.data)).toList();

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}
