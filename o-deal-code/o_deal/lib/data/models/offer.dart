import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/models/store.dart';
import 'package:o_deal/data/notifiers/product_state.dart';

class Offer {
  late String? id;
  late String name;
  late String product_id;
  late String store_id;
  late Product? product;
  late Store? store;
  late String? description;
  late int? discount;
  late String? discount_type;
  late String? other_offer;
  late String? start_time;
  late String? end_time;
  late String? weekdays;
  late String? start_date;
  late String? end_date;
  late bool? just_for_today;
  late bool? draft;

  Offer({
    this.id,
    required this.name,
    required this.product_id,
    required this.store_id,
    this.product,
    this.description,
    this.discount,
    this.discount_type,
    this.other_offer,
    this.start_time,
    this.end_time,
    this.weekdays,
    this.start_date,
    this.end_date,
    this.just_for_today,
    this.draft,
  });

  Offer.fromJson(Map<String, dynamic> json) {
    id = json["\$id"].toString();
    name = json['name'].toString();
    product_id = json['product_id'].toString();
    store_id = json['store_id'].toString();
    description = json['description'].toString();
    discount = json['discount'];
    discount_type = json['discount_type'];
    other_offer = json['other_offer'];
    start_time = json['start_time'];
    end_time = json['end_time'];
    weekdays = json['weekdays'];
    start_date = json['start_date'];
    end_date = json['end_date'];
    just_for_today = json['just_for_today'];
    draft = json['draft'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['product_is'] = product_id;
    data['description'] = description;
    data['discount'] = discount;
    data['discount_type'] = discount_type;
    data['other_offer'] = other_offer;
    data['start_time'] = start_time;
    data['end_time'] = end_time;
    data['weekdays'] = weekdays;
    data['start_date'] = start_date;
    data['end_date'] = end_date;
    data['just_for_today'] = just_for_today;
    data['draft'] = draft;
    return data;
  }
}
