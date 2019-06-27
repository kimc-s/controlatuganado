import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de ganado'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
                child: Text('ANIMALES', style: TextStyle(fontSize: 30.0)),
                color: Colors.lightBlue,
                textColor: Colors.white,
                elevation: 10.0,
                shape: StadiumBorder(),
                onPressed: () {
                  Navigator.pushNamed(context, 'animales');
                },
              ),
      ),
      backgroundColor: Colors.green,
    );
  }
}