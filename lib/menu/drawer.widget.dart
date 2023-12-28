import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.params.dart';

class MyDrawer  extends StatelessWidget{
  late SharedPreferences prefs;

  //const MyDrawer({Key? Key}): super(key:Key);
  @override
  Widget build(BuildContext context){
    return Drawer(
        child:ListView(
          children: [
            DrawerHeader(decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white,Colors.purple])
            ),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/profil.jpg"),
                    radius: 80,
                  ),
                )),
            ...(GlobalParams.menus as List).map((item)
            {
              return Column(
                children: [
                  ListTile(
                    title: Text('${item['title']}',style: TextStyle(fontSize: 22),),
                    leading: item['icon'],
                    trailing: Icon(Icons.arrow_right,color: Colors.purpleAccent,),
                    onTap: ()async{
                      if('${item['title']}'!="deconnexion"){
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "${item['route']}");
                      }
                      else
                      {
                       FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(context, '/authentification', (route) => false);
                      }
                    },
                  ),
                  Divider(height: 4,color: Colors.purpleAccent)
                ],
              );
            })
          ],
        ));}
}
