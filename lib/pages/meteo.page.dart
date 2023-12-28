import 'package:atelier3/pages/meteoDetails..page.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';


class MeteoPage extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MeteoPage> {
  final TextEditingController txt_ville = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Meteo Page')),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_ville,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    hintText: 'ville',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    _onGetMeteoDelaits(context);
                  },
                  child: Text('Chercher', style: TextStyle(fontSize: 22))),
            ),

          ],
        )
    );
  }

  void _onGetMeteoDelaits (BuildContext context){
    String v=txt_ville.text;
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context)=> MeteoDetailsPage(v)
        ));
    txt_ville.text="";
  }
}


