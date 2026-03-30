import 'package:flutter/material.dart';
import 'package:location_tracker/features/custom_google_maps/presentation/widgets/custom_google_maps_view_body.dart';

class CustomGoogleMapsView extends StatelessWidget {
  const CustomGoogleMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomGoogleMapsViewBody());
  }
}

//!-- Zoom Level --!
// World View => 0 - 3
// country View => 4 - 7
// city View => 10 - 12
// street View => 13 - 16
// building View => 17 - 20
