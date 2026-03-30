import 'package:flutter/material.dart';
import 'package:location_tracker/features/custom_google_maps/presentation/pages/custom_google_maps_view.dart';

void main() {
  runApp(const LiveLocationTracker());
}

class LiveLocationTracker extends StatelessWidget {
  const LiveLocationTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMapsView(),
    );
  }
}
