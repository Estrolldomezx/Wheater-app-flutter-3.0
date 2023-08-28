
import 'package:geolocator/geolocator.dart';

class Location {
  // remove late
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
// getCurrentPosition
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  static getCurrentPosition({required LocationAccuracy desiredAccuracy}) {}
}