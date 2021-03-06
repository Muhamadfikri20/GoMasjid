import 'package:locatey/models/geometry.dart';
import 'package:locatey/models/opening.dart';

class Place {
  final String name;
  final double rating;
  final int userRatingCount;
  final String vicinity;
  final Geometry geometry;
  final double distance;
  final Opening openingHours;

  Place({this.geometry, this.name, this.rating, this.userRatingCount, this.vicinity, this.distance, this.openingHours});

  Place.fromJson(Map<dynamic, dynamic> parsedJson)
      : name = parsedJson['name'],
        rating = (parsedJson['rating'] != null) ? parsedJson['rating'].toDouble() : null,
        userRatingCount = (parsedJson['user_ratings_total'] != null) ? parsedJson['user_ratings_total'] : null,
        vicinity = parsedJson['vicinity'],
        geometry = Geometry.fromJson(parsedJson['geometry']),
        distance = (parsedJson['distance'] != null) ? parsedJson['distance'].toDouble() : null,
        openingHours = (parsedJson['opening_hours'] != null) ? Opening.fromJson(parsedJson['opening_hours']) : null;
}
