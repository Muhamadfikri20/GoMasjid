import 'package:locatey/models/location.dart';

class Opening {
  final bool open;

  Opening({this.open});

  Opening.fromJson(Map<dynamic, dynamic> parsedJson) : open = parsedJson == null ? null : parsedJson['open_now'];
}
