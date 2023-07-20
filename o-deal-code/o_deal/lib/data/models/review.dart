class Review {
  late String name;
  late String? id;
  late String storeId;
  late int price;
  late int? offerPrice;
  late String? description;
  late List<dynamic>? galery;

  Review({
    this.id,
    required this.name,
    required this.price,
    required this.storeId,
    this.offerPrice,
    this.description,
    this.galery,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json["\$id"].toString();
    name = json['name'].toString();
    storeId = json['storeId'].toString();
    price = json['price'];
    offerPrice = json['offerPrice'];
    description = json['description'].toString();
    galery = json['galery'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['storeId'] = storeId;
    data['price'] = price;
    data['offerPrice'] = offerPrice;
    data['description'] = description;
    data['galery'] = galery;

    return data;
  }
}
