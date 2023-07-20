import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:o_deal/core/env/AppCred.dart';
import 'package:o_deal/data/models/offer.dart';
import 'package:provider/provider.dart';

class OfferState extends ChangeNotifier {
  final String collectionId = "63ce5ee41e71d6446e46";
  Client client = Client();
  late Databases db;
  List<Offer> offers = [];

  OfferState() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId); //
    db = Databases(client);
  }

  getOffer(String offerId) {}

  getNearbyOffers(String store_id, BuildContext context) async {
    // print("gettin");
    try {
      // var res = await db.listDocuments(
      //     databaseId: Appcred.databaseId,
      //     collectionId: collectionId,
      //     queries: [Query.equal("store_id", store_id)]);

      // print(res);
      // print(res.documents);
      // offers = res.documents.map((gl) => Offer.fromJson(gl.data)).toList();

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  getOffers(String store_id, BuildContext context) async {
    // print("gettin");
    try {
      var res = await db.listDocuments(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          queries: [Query.equal("store_id", store_id)]);

      // print(res);
      // print(res.documents);
      offers = res.documents.map((gl) => Offer.fromJson(gl.data)).toList();

      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  addOffer(String id, var data, BuildContext context) async {
    try {
      var req = await db.createDocument(
          databaseId: Appcred.databaseId,
          collectionId: collectionId,
          documentId: id,
          data: data);
      if (req.data != null) {
        offers.add(Offer.fromJson(req.data));
      }
    } catch (e) {
      print(e);
    }
  }
}
