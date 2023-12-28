import 'package:flutter/material.dart';
class GlobalParams{
  static List<Map<String,dynamic>>
  menus=[
    {"title":"Accueil"," icon":Icon(Icons.home,color: Colors.blue),"route": "/home"},
    {"title":"Meteo"," icon":Icon(Icons.ac_unit,color: Colors.blue),"route": "/meteo"},
    {"title":"Gallerie"," icon":Icon(Icons.add_a_photo_sharp,color: Colors.blue),"route": "/gallerie"},
    {"title":"Pays"," icon":Icon(Icons.abc_outlined,color: Colors.blue),"route": "/pays"},
    {"title":"Contact"," icon":Icon(Icons.add_call,color: Colors.blue),"route": "/contact"},
    {"title":"Parametres"," icon":Icon(Icons.add_chart_outlined,color: Colors.blue),"route": "/parametres"},
    {"title":"Deconnexion"," icon":Icon(Icons.account_circle_outlined,color: Colors.blue),"route": "/authentification"},
  ];
  static List<Map<String,dynamic>>Acceuil=[
    {"image": AssetImage('images/meteo.png'),"height":"180","width": "180","route": "/meteo"},
    {"image": AssetImage('images/contact.png'),"height":"180","width": "180","route": "/contact"},
    {"image": AssetImage('images/gallerie.png'),"height":"180","width": "180","route": "/gallerie"},
    {"image": AssetImage('images/parametres.png'),"height":"180","width": "180","route": "/parametres"},
    {"image": AssetImage('images/pays.png'),"height":"180","width": "180","route": "/pays"},
    {"image": AssetImage('images/deconnexion.png'),"height":"180","width": "180","route": "/authentification"},



  ];


}