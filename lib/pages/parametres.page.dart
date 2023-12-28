
import 'package:flutter/material.dart';

class ParametresPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parametres',
          style: TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Text(
          'Regler Parametres',
          style: TextStyle(fontSize: 20),
        ),
      ),

    );
  }
}