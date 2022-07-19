import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:locatey/services/geolocator_service.dart';
import 'package:locatey/services/marker_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/place.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    final geoService = GeoLocatorService();
    final markerService = MarkerService();

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        body: (currentPosition != null)
            ? Consumer<List<Place>>(
                builder: (_, places, __) {
                  if (places != null) {
                    places.sort((a, b) => a.distance.compareTo(b.distance));
                  }
                  return (places != null)
                      ? Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                  itemCount: places.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        title: Text(places[index].name),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 3.0,
                                            ),
                                            (places[index].rating != null)
                                                ? Row(
                                                    children: <Widget>[
                                                      RatingBarIndicator(
                                                        rating: places[index].rating,
                                                        itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                                                        itemCount: 5,
                                                        itemSize: 10.0,
                                                        direction: Axis.horizontal,
                                                      )
                                                    ],
                                                  )
                                                : Row(),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            places[index].distance != null ? Text('${places[index].vicinity} \u00b7 ${places[index].distance.toStringAsFixed(1)} km') : Container(),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            places[index].openingHours != null
                                                ? places[index].openingHours.open == true
                                                    ? Text("Buka", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green))
                                                    : Text("Tutup", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red))
                                                : Container(),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.directions),
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            _launchMapsUrl(places[index].geometry.location.lat, places[index].geometry.location.lng, places[index].name);
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        )
                      : Center(child: CircularProgressIndicator());
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void _launchMapsUrl(double lat, double lng, String name) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      MapsLauncher.launchCoordinates(lat, lng, name);
    } else {
      throw 'Could not launch $url';
    }
  }
}
