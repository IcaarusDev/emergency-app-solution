import 'package:flutter/cupertino.dart';
import 'package:permission/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController mapController;

  PermissionName permissionName = PermissionName.Location;

  final LatLng _center = const LatLng(-7.23056, -35.88111);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.local_hospital),
              ),
              Text('Emergency App'),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        ),
      ),
      bottomNavigationBar: Container(
        child: Card(
          child: Row(
            children: <Widget>[
              RaisedButton(
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  'Solicitar serviço',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
