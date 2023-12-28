import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

//import 'package:intl/intl.dart';

class MeteoDetailsPage extends StatefulWidget {
  String ville = "";

  MeteoDetailsPage(this.ville);

  @override
  _MeteoDetailsPageState createState() => _MeteoDetailsPageState(ville);
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;
  final String ville;

  _MeteoDetailsPageState(this.ville);

  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    print("Méteo de la ville de " + ville);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=sfax&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(this.meteoData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Meteo Details ${widget.ville}")),
      body: meteoData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: (meteoData == null ? 0 : meteoData['list'].length),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(2.0),
            // Ajustez la valeur en fonction de vos besoins
            child: Card(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      //ce widget sera développé dans la question 8
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png",
                        ),
                      ),
                      SizedBox(width: 8.0),
                      // Espacement horizontal entre les widgets
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //ce widget sera développé dans la question 9
                          Text(
                            "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          //ce widget sera développé dans la question 10
                          Text(
                            "${DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))} - ${meteoData['list'][index]['weather'][0]['description']}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //ce widget sera développé dans la question 11
                  Text(
                    "${(meteoData['list'][index]['main']['temp'] ~/ 10)}°C",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
