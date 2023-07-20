import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:o_deal/core/env/AppCred.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/store_state.dart';
import 'package:provider/provider.dart';

class ProductState extends ChangeNotifier {
  final String collectionId = "63ce5edacd4514cb82ad";
  Client client = Client();
  late Databases db;
  List<Product> products = [];
  Product? product;

  ProductState() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId); //
    db = Databases(client);
  }

  getProduct(String productId) async {
    try {
      var res = await db.getDocument(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          documentId: productId);

      // print(res);
      // print(res.documents);
      // products = res.documents.map((gl) => Product.fromJson(gl.data)).toList();
      product = Product.fromJson(res.data);

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  getProducts(Store store, BuildContext context) async {
    // print("gettin");
    try {
      var res = await db.listDocuments(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          queries: [Query.equal("storeId", store.id)]);

      // print(res);
      // print(res.documents);
      products = res.documents.map((gl) => Product.fromJson(gl.data)).toList();

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  addProduct(String id, var data, BuildContext context) async {
    try {
      var req = await db.createDocument(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          documentId: id,
          data: data);
      if (req.data != null) {
        StoreState ss = Provider.of<StoreState>(context, listen: false);
        await ss.updateStore(ss.store!.id.toString(),
            {"total_products": ss.store!.total_products! + 1});
        products.add(Product.fromJson(req.data));
      }
    } catch (e) {
      print(e);
    }
  }

  updateProduct(String id, var data, BuildContext context) async {
    try {
      print(id);
      var req = await db.updateDocument(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          documentId: id,
          data: data);
      if (req.data != null) {
        // StoreState ss = Provider.of<StoreState>(context, listen: false);
        // await ss.updateStore(ss.store!.id.toString(),
        //     {"total_products": ss.store!.total_products! + 1});
        // products.add(Product.fromJson(req.data));
        Product newProduct = Product.fromJson(req.data);
        products = List<Product>.from(
            products.map((p) => p.id == newProduct.id ? newProduct : p));
      }
    } catch (e) {
      print(e);
    }
  }
}
