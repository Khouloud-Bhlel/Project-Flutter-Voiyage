import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../menu/drawer.widget.dart';
import 'gallerie-details.page.dart';

class GalleriePage extends StatefulWidget {
  @override
  _GalleriePageState createState() => _GalleriePageState();
}

class _GalleriePageState extends State<GalleriePage> {
  final TextEditingController txt_image = TextEditingController();

  void _onGetGallerieDetails(BuildContext context) {
    String image = txt_image.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GallerieDetailsPage(image),
      ),
    );
    txt_image.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Galerie')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_image,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.image),
                hintText: 'Image',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                _onGetGallerieDetails(context);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }
}
