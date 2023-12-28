import 'package:atelier3/pages/authentification.page.dart';
import 'package:atelier3/pages/contact.page.dart';
import 'package:atelier3/pages/gallerie.page.dart';
import 'package:atelier3/pages/home.page.dart';
import 'package:atelier3/pages/inscription.page.dart';
import 'package:atelier3/pages/meteo.page.dart';
import 'package:atelier3/pages/parametres.page.dart';
import 'package:atelier3/pages/pays.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
runApp (MyApp());
}
class MyApp extends StatelessWidget {
  final routes = {
      '/home':(context) =>HomePage(),
    '/inscription':(context) =>InscriptionPage(),
    '/authentification':(context) =>AuthentificationPage(),
    '/parametres':(context) =>ParametresPage(),
    '/meteo':(context) =>MeteoPage(),
    '/gallerie':(context) =>GalleriePage(),
    '/pays':(context) =>PaysPage(),
    '/contact':(context) =>ContactPage(),

};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),

      routes: routes,
      home:StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges (),
          builder: (context, snapshot) {
            if(snapshot.hasData)
              return HomePage();
            else
              return AuthentificationPage();
          }),);
  }
}