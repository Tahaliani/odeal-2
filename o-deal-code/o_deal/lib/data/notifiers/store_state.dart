import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/core/env/AppCred.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/helper_state.dart';
import 'package:provider/provider.dart';

class StoreState extends ChangeNotifier {
  final String collectionId = "63ce5ed036462ee23199";
  Client client = Client();
  late Databases db;
  late Realtime realtime;
  List<Store> stores = [];
  Store? store;

  StoreState() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId); //
    db = Databases(client);
    realtime = Realtime(client);
  }

  getStore(String? id, BuildContext context) async {
    try {
      id == null ? id = Provider.of<authstate>(context).user.id : id = id;
      var res = await db.getDocument(
        databaseId: Appcred.databaseId,
        collectionId: collectionId,
        documentId: id,
      );
      store = Store.fromJson(res.data);

      // final subscription = realtime.subscribe([
      //   'databases.${Appcred.databaseId}.collections.$collectionId.documents.$id'
      // ]);

      // subscription.stream.listen(
      //   (response) {
      //     print(response);
      //   },
      // );
      // print(store);
      notifyListeners();
      return store;
    } catch (e) {
      print(e);
    }
  }

  getStores(BuildContext context) async {
    // print("gettin");
    try {
      var res = await db.listDocuments(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          queries: []);

      // print(res);
      // print(res.documents);
      stores = res.documents.map((gl) => Store.fromJson(gl.data)).toList();

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  createStore(String id) async {
    var data = {
      "name": "My Shop",
      "address": "Store address",
      "contact": "+1234567890",
      "category": "No Category",
      "total_products": 0,
      "total_customer": 0,
      "total_orders": 0,
      "offer_claimed": 0,
      "image":
          "https://endpoint.odeal.shop/v1/storage/buckets/63d3742e9ffbdc3bcd38/files/63d3748aa5ef160dbb6e/preview?project=63be9eb7dd5fe7dbc4f1",
      "decoration_image":
          "https://endpoint.odeal.shop/v1/storage/buckets/63d3742e9ffbdc3bcd38/files/63d374831f7b7b27da5b/preview?project=63be9eb7dd5fe7dbc4f1",
    };
    try {
      var res = await db.createDocument(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          documentId: id,
          data: data);
      stores.add(Store.fromJson(res.data));
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  updateStore(String id, var data) async {
    try {
      var res = await db.updateDocument(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          documentId: id,
          data: data);
      store = Store.fromJson(res.data);

      stores =
          List<Store>.from(stores.map((s) => s.id == store!.id ? store : s));
      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}
