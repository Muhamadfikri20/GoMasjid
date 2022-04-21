import 'package:locatey/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'dart:math' show sin, cos, sqrt, atan2;

class PlacesService {
  final key = 'AIzaSyBXfI1VzlRNZ-lzoIa0iCl1x8T3g1qMrGU';
  static String place = 'mosque';
  double distance;

  /*
  var locationNearby = {
    "html_attributions": [],
    "next_page_token":
        "Aap_uEC1HXiwuMeds_8_Ww7j3iyNQkIOP4BxmebeGUApq5sSqJgXfvGwawfFpHi0nCVDyeBHXv5oklwOfnFnWkkO1Bz7m0kVtAd-LuPyrC9IQeo7-FONhrhu3AbecNQ3ES0WmBhvyzZQghxK_f275bpcjgsgQlA9-v2M_DNVvN_krqPuS6aXi2wHNL_NqX1AbOOuiHP6mkItg5awFhW9LE-VNdedkXKTHxyFjW7T8nB9sgZCsIsFZMadO6zRijTkp9WM7eZtuKsxLvD_unJWHrymAGkflXe_QMrjzfFKtTxOpILBdKoKsdQalxBQ7ghGsa4l49I3zfW-FVqamafDhUR9J-308miSHpAAu5IaXWhIYOLyY0Ax3DXmLP65FeRJ9Qi-TwKEszBt8Qr4g6UqzzymLNH0nx6XN0T1q9H0AzGxP8ix63nD2aihW-8",
    "results": [
      {
        "business_status": "OPERATIONAL",
        "geometry": {
          "location": {"lat": -6.2617889, "lng": 107.1203601},
          "viewport": {
            "northeast": {"lat": -6.260325019708498, "lng": 107.1217659302915},
            "southwest": {"lat": -6.263022980291502, "lng": 107.1190679697085}
          }
        },
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_islam-71.png",
        "icon_background_color": "#7B9EB0",
        "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_islam_pinlet",
        "name": "Masjid Baitul Ma'muur",
        "opening_hours": {"open_now": true},
        "photos": [
          {
            "height": 3264,
            "html_attributions": ["<a href=\"https://maps.google.com/maps/contrib/115385544904081799876\">Romy Al-Jimar</a>"],
            "photo_reference":
                "Aap_uEBQAKMOqtEUzlmw-bUzt7pN3jX9AhHuveZLmVai5eQi54KYhont0XNrTbo7FXUMm_nJVbZi8s5rmDjzOhUWm9jYmLKqjKMubbM_ked8G89lGyCRygSsOQaofSyNt3YD-_meVGgkKnr1qG3KnmxL5rw-CnaUbpsaUOKDMippOi7oz5oq",
            "width": 2448
          }
        ],
        "place_id": "ChIJiSTxN2yFaS4Rw2FRlD2Beyw",
        "plus_code": {"compound_code": "P4QC+74 Telagamurni, Bekasi Regency, West Java, Indonesia", "global_code": "6P59P4QC+74"},
        "rating": 4.8,
        "reference": "ChIJiSTxN2yFaS4Rw2FRlD2Beyw",
        "scope": "GOOGLE",
        "types": ["mosque", "place_of_worship", "point_of_interest", "establishment"],
        "user_ratings_total": 349,
        "vicinity": "Perumahan Telaga Sakinah, Telagamurni"
      },
      {
        "business_status": "OPERATIONAL",
        "geometry": {
          "location": {"lat": -6.268842899999999, "lng": 107.1211765},
          "viewport": {
            "northeast": {"lat": -6.267608369708497, "lng": 107.1225539802915},
            "southwest": {"lat": -6.270306330291501, "lng": 107.1198560197085}
          }
        },
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_islam-71.png",
        "icon_background_color": "#7B9EB0",
        "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_islam_pinlet",
        "name": "Mesjid Nurut Taqwa",
        "photos": [
          {
            "height": 4000,
            "html_attributions": ["<a href=\"https://maps.google.com/maps/contrib/112494650840456923767\">Yoko Nurhabibi</a>"],
            "photo_reference":
                "Aap_uEBBTYrHwzFWWp_SPXrZv5jAMtyGhf0K8e71JxU7FsKDGsWEN3GbgByGZispcdHmwgjcxnTu7cIGQtBsUZde8AjMgVj1KnhHQHHSxLx73i2vAiqJDLAMJeHeZG185LK7NX1JHff8zpQmi1WpDDMb3nJfwrkJrEyj37Ibsi3ZVonilPOU",
            "width": 3000
          }
        ],
        "place_id": "ChIJPQjw2UGFaS4RwiMBcESdcE8",
        "plus_code": {"compound_code": "P4JC+FF Kalijaya, Bekasi Regency, West Java, Indonesia", "global_code": "6P59P4JC+FF"},
        "rating": 4.7,
        "reference": "ChIJPQjw2UGFaS4RwiMBcESdcE8",
        "scope": "GOOGLE",
        "types": ["mosque", "place_of_worship", "point_of_interest", "establishment"],
        "user_ratings_total": 353,
        "vicinity": "Jalan Raya Imam Bonjol, Warung Bongkok, Kalijaya"
      },
      {
        "business_status": "OPERATIONAL",
        "geometry": {
          "location": {"lat": -6.2605862, "lng": 107.1432807},
          "viewport": {
            "northeast": {"lat": -6.259378869708498, "lng": 107.1447259802915},
            "southwest": {"lat": -6.262076830291503, "lng": 107.1420280197085}
          }
        },
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_islam-71.png",
        "icon_background_color": "#7B9EB0",
        "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_islam_pinlet",
        "name": "Masjid Besar Al Mukarromah Cikarang",
        "opening_hours": {"open_now": true},
        "photos": [
          {
            "height": 3000,
            "html_attributions": ["<a href=\"https://maps.google.com/maps/contrib/104818997856720713992\">Tauqoly Abadi Cikarang</a>"],
            "photo_reference":
                "Aap_uEBZcX14BDVYLIPcv9eHPz0D2IRfORkjeXLJI-7yyG-2a5ySmLPihnsWMXfSFLwVlR9lkxQHK_v814ZusuGPoVv7w6G9RV2vaRnmTHZkG1CQc2c8NahpE8UvTr7l6mNMuiINXFpoYhLFk3-wUn2FwTVNUwB63L9DQfVuHhqa7XTT9aM9",
            "width": 4000
          }
        ],
        "place_id": "ChIJjWAROh2FaS4Ro_6gxBc8XpE",
        "plus_code": {"compound_code": "P4QV+Q8 Cikarang Kota, Bekasi Regency, West Java, Indonesia", "global_code": "6P59P4QV+Q8"},
        "rating": 4.7,
        "reference": "ChIJjWAROh2FaS4Ro_6gxBc8XpE",
        "scope": "GOOGLE",
        "types": ["mosque", "place_of_worship", "point_of_interest", "establishment"],
        "user_ratings_total": 424,
        "vicinity": "Jalan RE. Martadinata No.5, Cikarang Kota"
      },
      {
        "business_status": "OPERATIONAL",
        "geometry": {
          "location": {"lat": -6.265033, "lng": 107.1014854},
          "viewport": {
            "northeast": {"lat": -6.263641869708497, "lng": 107.1028401302915},
            "southwest": {"lat": -6.266339830291502, "lng": 107.1001421697085}
          }
        },
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_islam-71.png",
        "icon_background_color": "#7B9EB0",
        "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_islam_pinlet",
        "name": "Masjid Al - Quds",
        "opening_hours": {"open_now": true},
        "photos": [
          {
            "height": 1920,
            "html_attributions": ["<a href=\"https://maps.google.com/maps/contrib/102673331797639951349\">SUDARMAJI</a>"],
            "photo_reference":
                "Aap_uEDpfroDZsx_AD3jm_syRz5eIogJHPKGB2TLegAGaBIectUnZyUbkKx8lc1yOucp3G94mbVmA0l6SrAVNlL51eSKLIh34Gm2Zl2WNqguofcQENWKi-AGtzp05aFRhSxLYdnqxxdZHaOXmZlYkgPjDIiCUUDL-2wmx-MA8Owso5QXNhvy",
            "width": 1080
          }
        ],
        "place_id": "ChIJay0K42GFaS4R8BQmnSlJcIY",
        "plus_code": {"compound_code": "P4M2+XH Telaga Asih, Bekasi Regency, West Java, Indonesia", "global_code": "6P59P4M2+XH"},
        "rating": 4.9,
        "reference": "ChIJay0K42GFaS4R8BQmnSlJcIY",
        "scope": "GOOGLE",
        "types": ["mosque", "place_of_worship", "point_of_interest", "establishment"],
        "user_ratings_total": 21,
        "vicinity": "Jalan Kompleks Aster, Telaga Asih"
      },
      {
        "business_status": "OPERATIONAL",
        "geometry": {
          "location": {"lat": -6.2595135, "lng": 107.1251237},
          "viewport": {
            "northeast": {"lat": -6.258076169708497, "lng": 107.1264774802915},
            "southwest": {"lat": -6.260774130291502, "lng": 107.1237795197085}
          }
        },
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_islam-71.png",
        "icon_background_color": "#7B9EB0",
        "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_islam_pinlet",
        "name": "Masjid Jami Al - Muhajirin",
        "photos": [
          {
            "height": 3024,
            "html_attributions": ["<a href=\"https://maps.google.com/maps/contrib/106212371083293956830\">Danang Hermawan</a>"],
            "photo_reference":
                "Aap_uEB6MWiFcJXJnQmEFzDc21OAVSXMf7UYx9N7UHZ4Nbp-G2GaOFMViZksmyzgmOP8qmAWPyfqpYun-qXIgfMKls6pX9c5y84Lb5pvmXzuHMipPYDWRUZTqIxmRUfIVTcAnipEfKdHPHh0i8j4bJVP-7deTcYluC_ZrV6hdKG1Rc4L3QNW",
            "width": 4032
          }
        ],
        "place_id": "ChIJN7AwtBKFaS4RvePITadPxSs",
        "plus_code": {"compound_code": "P4RG+52 Telagamurni, Bekasi Regency, West Java, Indonesia", "global_code": "6P59P4RG+52"},
        "rating": 4.5,
        "reference": "ChIJN7AwtBKFaS4RvePITadPxSs",
        "scope": "GOOGLE",
        "types": ["mosque", "place_of_worship", "point_of_interest", "establishment"],
        "user_ratings_total": 4,
        "vicinity": "Jalan Raya Telaga Harapan, Telagamurni"
      },
    ],
    "status": "OK"
  };
  */

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$place&radius=5000&key=$key');
    // await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$place&rankby=distance&key=$key');
//online
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    for (int i = 0; i < jsonResults.length; i++) {
      await getDistanceHa(lat, lng, jsonResults[i]['geometry']['location']['lat'], jsonResults[i]['geometry']['location']['lng'], 6371000, i);
      jsonResults[i].addAll({"distance": distance});
    }

    return jsonResults.map((place) => Place.fromJson(place)).toList();

/*Offline
    // var jsonResults = locationNearby['results'] as List;

    // for (int i = 0; i < jsonResults.length; i++) {
    //   await getDistanceHa(lat, lng, jsonResults[i]['geometry']['location']['lat'], jsonResults[i]['geometry']['location']['lng'], 6371000, i);
    //   jsonResults[i].addAll({"distance": distance});
    // }

    return jsonResults.map((place) => Place.fromJson(place)).toList();
    */
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
