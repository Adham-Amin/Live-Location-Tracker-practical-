import 'package:location/location.dart';

class LocationServices {
  final Location _location = Location();

  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service disabled');
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Permission denied');
      }
    }

    return await _location.getLocation();
  }

  Stream<LocationData> getLocationStream() {
    _location.changeSettings(distanceFilter: 2);
    return _location.onLocationChanged;
  }
}
