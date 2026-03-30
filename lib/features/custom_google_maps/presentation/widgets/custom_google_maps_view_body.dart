import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapsViewBody extends StatefulWidget {
  const CustomGoogleMapsViewBody({super.key});

  @override
  State<CustomGoogleMapsViewBody> createState() =>
      _CustomGoogleMapsViewBodyState();
}

class _CustomGoogleMapsViewBodyState extends State<CustomGoogleMapsViewBody> {
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(28.6483557, 30.8303655),
      zoom: 14,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}
