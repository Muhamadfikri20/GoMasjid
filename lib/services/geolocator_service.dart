import 'package:geolocator/geolocator.dart';
import 'dart:math' show sin, cos, sqrt, atan2;

class GeoLocatorService {
  final geolocator = Geolocator();

  Future<Position> getLocation() async {
    return await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, locationPermissionLevel: GeolocationPermission.location);
  }

  Future<double> getDistance(double startLatitude, double startLongitude, double endLatitude, double endLongitude) async {
    return await getDistanceHa(startLatitude, startLongitude, endLatitude, endLongitude, 6371000);
  }

  Future<double> getDistanceHa(double tikorLat2, double tikorLong2, double tikorLat1, double tikorLong1, double earthRadius) {
    var lat1 = (tikorLat1 * 3.14) / 180;
    var long1 = (tikorLong1 * 3.14) / 180;
    var lat2 = (tikorLat2 * 3.14) / 180;
    var long2 = (tikorLong2 * 3.14) / 180;
    var dLat = lat2 - lat1; //
    var dLng = long2 - long1;
    var a = (sin(dLat / 2) * sin(dLat / 2)) + (cos(lat1) * cos(lat2)) * sin(dLng / 2) * sin(dLng / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = earthRadius * c;
    print(dLat);
    print(dLng);
    print(a);
    print(c);
    print(d); //d is the distance in meters
    var kilometer = d / 1000;
    print(kilometer);
    return Future.value(d);
  }
}
