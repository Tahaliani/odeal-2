import 'package:o_deal/data/models/offer.dart';

class Product {
  late String name;
  late String? id;
  late String storeId;
  late int price;
  late int? offerPrice;
  late String? description;
  late String? image;
  late List<dynamic>? galery;
  late double? rating;
  late Offer? activeOffer;
  late List<Offer>? offers;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.storeId,
    this.offerPrice,
    this.description,
    this.image,
    this.galery,
    this.rating,
    this.activeOffer,
    this.offers,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["\$id"].toString();
    name = json['name'].toString();
    storeId = json['storeId'].toString();
    price = json['price'];
    offerPrice = json['offerPrice'];
    description = json['description'].toString();
    image = json['image'];
    galery = json['galery'];
    rating = double.parse(json['rating'].toString());
    activeOffer = null;
    offers = null;
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['storeId'] = storeId;
    data['price'] = price;
    data['offerPrice'] = offerPrice;
    data['description'] = description;
    data['image'] = image;
    data['galery'] = galery;
    data['rating'] = rating;
    return data;
  }
}
