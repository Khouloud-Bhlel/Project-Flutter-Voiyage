
import 'package:flutter/material.dart';

class PaysPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pays',
          style: TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Text(
          'Pays',
          style: TextStyle(fontSize: 20),
        ),
      ),

    );
  }
}