import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_tracker/core/services/location_service.dart';

class CustomGoogleMapsViewBody extends StatefulWidget {
  const CustomGoogleMapsViewBody({super.key});

  @override
  State<CustomGoogleMapsViewBody> createState() =>
      _CustomGoogleMapsViewBodyState();
}

class _CustomGoogleMapsViewBodyState extends State<CustomGoogleMapsViewBody> {
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};
  LocationServices locationService = LocationServices();

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(28.6483557, 30.8303655),
      zoom: 3,
    );
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        googleMapController = controller;
        getLocationStream();
      },
      initialCameraPosition: initialCameraPosition,
      markers: markers,
    );
  }

  void getLocationStream() {
    locationService.getLocationStream().listen((location) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude!, location.longitude!),
            zoom: 18,
          ),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId('myLocation'),
          position: LatLng(location.latitude!, location.longitude!),
        ),
      );
      setState(() {});
    });
  }

  void getCurrentLocation() {
    locationService.getCurrentLocation().then((location) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude!, location.longitude!),
            zoom: 18,
          ),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId('myLocation'),
          position: LatLng(location.latitude!, location.longitude!),
        ),
      );
      setState(() {});
    });
  }
}
