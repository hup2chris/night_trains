import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:night_trains/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // GoogleMapController mapController;

  /* final LatLng _center = const LatLng(53.9000, 4.1167);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'European Night Trains',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
      /* home: Scaffold(
        appBar: AppBar(
          title: const Text('European Night Trains'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 4.25,
          ),
        ),
      ),*/
    );
  }
}
