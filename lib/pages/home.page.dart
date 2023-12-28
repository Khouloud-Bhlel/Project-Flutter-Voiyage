import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/global.params.dart';
import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Page Home')),
      body: Column(
        children:[
          Container(
          padding: EdgeInsets.all(10),
      child: Text("Utilisateur:${user?.email}",style:TextStyle(fontSize:22)),

  ),
      Center(
        child:Wrap(
             children:[
        ...(GlobalParams.Acceuil as List).map((item) {

    return InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: item["image"],
              ),
              onTap: () {
               if('${item["route"]}'!="/authentification")
                 Navigator.pushNamed(context, "${item['route']}");
               else
                 _Deconnexion(context);
    }

    );
  }).toList(),
  ],
  ),
  ),
  ],
  ),
  );
}

  void _Deconnexion( context) async{
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic>route) => false);
  }
}
