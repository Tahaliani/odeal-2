import 'package:appwrite/models.dart';

class User {
  late String id;
  late String email;
  late String name;
  late String phone;
  late Preferences preferences;
  late bool verified;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.phone,
      required this.preferences});

  User.fromJson(json) {
    id = json.$id;
    email = json.email;
    name = json.name;
    phone = json.phone;
    preferences = json.prefs;
    verified = false;
  }
}
