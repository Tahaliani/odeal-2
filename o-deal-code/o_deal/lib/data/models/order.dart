import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/notifiers/product_state.dart';

class Order {
  late String? id;
  late String customer_name;
  late String customer_number;
  late String customer_id;
  late String store_id;
  late String product_id;
  late Product? product;
  late String created_on;
  late String payment_id;
  late String payment_status;

  Order({
    this.id,
    required this.customer_name,
    required this.customer_number,
    required this.customer_id,
    required this.store_id,
    required this.product_id,
    required this.created_on,
    required this.payment_id,
    required this.payment_status,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json["\$id"].toString();
    customer_name = json['customer_name'].toString();
    customer_number = json['customer_number'].toString();
    customer_id = json['customer_id'].toString();
    store_id = json['store_id'].toString();
    product_id = json['product_id'].toString();
    created_on = json['\$createdAt'].toString();
    payment_id = json['payment_id'].toString();
    payment_status = json['payment_status'].toString();
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_name'] = customer_name;
    data['customer_number'] = customer_number;
    data['customer_id'] = customer_id;
    data['store_id'] = store_id;
    data['product_id'] = product_id;
    data['payment_id'] = payment_id;
    data['payment_status'] = payment_status;

    return data;
  }
}
