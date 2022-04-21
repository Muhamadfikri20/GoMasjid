import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locatey/models/place.dart';
import 'package:locatey/screens/search.dart';
import 'package:locatey/services/geolocator_service.dart';
import 'package:locatey/services/places_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
        '/locate': (context) => MyApp2(),
        '/about': (context) => MyApp3(),
      },
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('GoMasjid'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 150,
                  width: 150,
                  child: new Image.asset('assets/images/logo.png'),
                ),
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Column(children: [
                    Text(
                      'Go Masjid',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Mudah dalam mencari Masjid Terdekat',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/locate');
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: Center(
                          child: Text(
                        "Cari Masjid",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )),
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20.0), boxShadow: [
                        BoxShadow(color: Colors.green, offset: Offset(4, 1), blurRadius: 1.0, spreadRadius: 2.0),
                      ]),
                    ),
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: Center(
                          child: Text(
                        "Tentang Aplikasi",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )),
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20.0), boxShadow: [
                        BoxShadow(color: Colors.green, offset: Offset(4, 1), blurRadius: 1.0, spreadRadius: 2.0),
                      ]),
                    ),
                  ))
                ],
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

class MyApp2 extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return (position != null) ? placesService.getPlaces(position.latitude, position.longitude) : null;
          },
        )
      ],
      child: MaterialApp(
        title: 'GoMasjid',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('GoMasjid'),
            backgroundColor: Colors.green,
          ),
          body: Search(),
        ),
      ),
    );
  }
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoMasjid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('Tentang Aplikasi'),
            backgroundColor: Colors.green,
          ),
          body: Card(
            color: Colors.grey[500],
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 150,
                    width: 150,
                    child: new Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(children: [
                      Text(
                        'About',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nama: Maulana Syarifudin',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sistem Informasi',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Tentang Aplikasi :\n\nAplikasi ini dibuat guna untuk membantu para muslim maupun muslimah dalam mencari masjid ketika sedang berpergian ke daerah-daerah di Indonesia.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Semoga aplikasi ini bisa membawa manfaat kedepannya.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState();
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String _value = 'one';
  var details = {
    'one': 'atm',
    'two': 'bakery',
    'three': 'bank',
    'four': 'beauty_salon',
    'five': 'bus_station',
    'six': 'cafe',
    'seven': 'car_repair',
    'eight': 'church',
    'nine': 'department_store',
    'ten': 'electronics_store',
    'eleven': 'gas_station',
    'twelve': 'hindu_temple',
    'thirteen': 'hospital',
    'fourteen': 'mosque',
    'fifteen': 'movie_theater',
    'sixteen': 'park',
    'seventeen': 'parking',
    'eighteen': 'pharmacy',
    'nineteen': 'police',
    'twenty': 'post_office',
    'twentyone': 'restaurant',
    'twentytwo': 'school',
    'twentythree': 'shopping_mall',
    'twentyfour': 'supermarket',
    'twentyfive': 'taxi_stand',
  };
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text('ATM'),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text('Bakery'),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text('Bank'),
            value: 'three',
          ),
          DropdownMenuItem<String>(
            child: Text('Beauty Salon'),
            value: 'four',
          ),
          DropdownMenuItem<String>(
            child: Text('Bus Station'),
            value: 'five',
          ),
          DropdownMenuItem<String>(
            child: Text('Cafe'),
            value: 'six',
          ),
          DropdownMenuItem<String>(
            child: Text('Car Repair'),
            value: 'seven',
          ),
          DropdownMenuItem<String>(
            child: Text('Church'),
            value: 'eight',
          ),
          DropdownMenuItem<String>(
            child: Text('Department Store'),
            value: 'nine',
          ),
          DropdownMenuItem<String>(
            child: Text('Electronics Store'),
            value: 'ten',
          ),
          DropdownMenuItem<String>(
            child: Text('Gas Station'),
            value: 'eleven',
          ),
          DropdownMenuItem<String>(
            child: Text('Hindu Temple'),
            value: 'twelve',
          ),
          DropdownMenuItem<String>(
            child: Text('Hospital'),
            value: 'thirteen',
          ),
          DropdownMenuItem<String>(
            child: Text('Mosque'),
            value: 'fourteen',
          ),
          DropdownMenuItem<String>(
            child: Text('Movie Theatre'),
            value: 'fifteen',
          ),
          DropdownMenuItem<String>(
            child: Text('Park'),
            value: 'sixteen',
          ),
          DropdownMenuItem<String>(
            child: Text('Parking Lot'),
            value: 'seventeen',
          ),
          DropdownMenuItem<String>(
            child: Text('Pharmacy'),
            value: 'eighteen',
          ),
          DropdownMenuItem<String>(
            child: Text('Police Station'),
            value: 'nineteen',
          ),
          DropdownMenuItem<String>(
            child: Text('Post Office'),
            value: 'twenty',
          ),
          DropdownMenuItem<String>(
            child: Text('Restaurant'),
            value: 'twentyone',
          ),
          DropdownMenuItem<String>(
            child: Text('School'),
            value: 'twentytwo',
          ),
          DropdownMenuItem<String>(
            child: Text('Shopping Mall'),
            value: 'twentythree',
          ),
          DropdownMenuItem<String>(
            child: Text('Super Market'),
            value: 'twentyfour',
          ),
          DropdownMenuItem<String>(
            child: Text('Taxi Stand'),
            value: 'twentyfive',
          ),
        ],
        onChanged: (String value) {
          setState(() {
            _value = value;
            PlacesService.place = details[value];
          });
        },
        hint: Text('Airport'),
        value: _value,
      ),
    );
  }
}
