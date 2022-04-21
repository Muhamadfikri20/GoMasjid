import 'package:locatey/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'dart:math' show sin, cos, sqrt, atan2;

class PlacesService {
  final key = 'AIzaSyBXfI1VzlRNZ-lzoIa0iCl1x8T3g1qMrGU';
  static String place = 'mosque';
  double distance;
  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$place&radius=5000&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    for (int i = 0; i < jsonResults.length; i++) {
      await getDistanceHa(lat, lng, jsonResults[i]['geometry']['location']['lat'], jsonResults[i]['geometry']['location']['lng'], 6371000, i);
      jsonResults[i].addAll({"distance": distance});
    }
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

  Future<double> getDistanceHa(double tikorLat2, double tikorLong2, double tikorLat1, double tikorLong1, double earthRadius, int i) {
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
    distance = kilometer;
    return Future.value(d);
  }
}
