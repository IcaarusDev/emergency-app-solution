import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
        child: Text('mapa',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            )),
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
