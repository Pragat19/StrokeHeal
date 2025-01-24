import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // For fetching user location
import 'package:google_maps_flutter/google_maps_flutter.dart'; // For Google Maps integration
import 'package:google_maps_webservice/places.dart';
import 'package:strokeheal/Home/mainDrawer.dart'; // For Google Places API

class NearestClinicsScreen extends StatefulWidget {
  @override
  _NearestClinicsScreenState createState() => _NearestClinicsScreenState();
}

class _NearestClinicsScreenState extends State<NearestClinicsScreen> {
  List<PlacesSearchResult> clinics = [];

  @override
  void initState() {
    super.initState();
    fetchNearbyClinics();
  }

  void fetchNearbyClinics() async {
    // Fetch user's current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    log("User Positionsssss $position");

    // Create a Google Maps Places instance
    GoogleMapsPlaces places =
        GoogleMapsPlaces(apiKey: 'AIzaSyAaRdKEXNtmqh5xbJ035G42NSNuubqmGsU');

    // Perform a nearby search for clinics
    PlacesSearchResponse response = await places.searchNearbyWithRadius(
      Location(lat: position.latitude, lng: position.longitude),
      1000, // Radius in meters (adjust as needed)
      type: 'hospital', // You can use 'clinic', 'hospital', etc.
    );
    log("Statusssssss ${response.status}");
    log("results-------------${response.results}");
    setState(() {
      clinics.addAll(response.results);

      log("$clinics");
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearest Clinics'),
      ),
      drawer: MainDrawer(),
      body: SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: clinics.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(clinics[index].name),
              subtitle: Text(clinics[index].vicinity.toString()),
            );
          },
        ),
      ),
    );
  }
}
