import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:o_deal/core/env/AppCred.dart';
import 'package:o_deal/data/models/offer.dart';
import 'package:provider/provider.dart';

class HelperState extends ChangeNotifier {
  final String offerCollectionId = "63ce5ee41e71d6446e46";
  Client client = Client();
  late Databases db;
  late Locale locale;
  List<Offer> offers = [];
  Position? _currentPosition;
  String? _currentAddress;
  get currentPosition => _currentPosition;
  get currentAddress => _currentAddress;
  late List<Placemark> placemarks;

  HelperState() {
    client.setEndpoint(Appcred.endpoint).setProject(Appcred.projectId); //
    db = Databases(client);
    locale = Locale(client);
  }

  getMyLocation(BuildContext context) async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.unableToDetermine) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Location Services are disabled, Please enable the services;"),
          ),
        );
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Location permissions are denied;"),
            ),
          );
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Location permissions are permanently denied, we cannot request permissions."),
          ),
        );
        return false;
      }

      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((position) async {
        _currentPosition = position;
        await placemarkFromCoordinates(
                _currentPosition!.latitude, _currentPosition!.longitude)
            .then((List<Placemark> placemarks) {
          Placemark place = placemarks[0];
          _currentAddress =
              '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        });
        notifyListeners();
        return position;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }
}
