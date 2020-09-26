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
  void initState() {
    super.initState();
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
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Send us some information!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          _showMyDialog();
                        },
                        child: Center(
                          child: Text(
                            'Just call for service!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Which one?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Select the service: ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Proceed'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
