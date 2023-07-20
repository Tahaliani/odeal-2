class Store {
  late String name;
  late String? id;
  late String? address;
  late String? contact;
  late String? category;
  late String? description;
  late int? total_products = 0;
  late int? total_customer = 0;
  late int? total_orders = 0;
  late int? offer_claimed = 0;
  late int? reviews = 0;
  late String? image;
  late String? decoration_image;
  late List<dynamic>? galery;

  Store({
    this.id,
    required this.name,
    this.address,
    this.contact,
    this.description,
    this.category,
    this.total_products,
    this.total_customer,
    this.total_orders,
    this.offer_claimed,
    this.reviews,
    this.image,
    this.decoration_image,
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json["\$id"].toString();
    name = json['name'].toString();
    address = json['address'].toString();
    contact = json['contact'].toString();
    description = json['description'].toString();
    category = json['category'].toString();
    total_products = json['total_products'];
    total_customer = json['total_customer'];
    total_orders = json['total_orders'];
    offer_claimed = json['offer_claimed'];
    reviews = json['reviews'];
    image = json['image'].toString();
    decoration_image = json['decoration_image'].toString();
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['contact'] = contact;
    data['category'] = category;
    data['description'] = description;
    data['total_products'] = total_products;
    data['total_customer'] = total_customer;
    data['total_orders'] = total_orders;
    data['offer_claimed'] = offer_claimed;
    data['reviews'] = reviews;
    data['image'] = image;
    data['decoration_image'] = image;
    return data;
  }
}
