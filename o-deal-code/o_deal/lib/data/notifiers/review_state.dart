import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:o_deal/core/env/AppCred.dart';
import 'package:o_deal/data/models/order.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:provider/provider.dart';

class ReviewState extends ChangeNotifier {
  final String collectionId = "63ce5eec7d61c9dd3f5d";
  Client client = Client();
  late Databases db;
  List<Order> orders = [];

  ReviewState() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId); //
    db = Databases(client);
  }

  getReview(String reviewId) {}

  getReviews(String customerId, String productId, BuildContext context) async {
    // print("gettin");
    try {
      var res = await db.listDocuments(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          queries: []);

      // print(res);
      // print(res.documents);
      orders = res.documents.map((gl) => Order.fromJson(gl.data)).toList();

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}
