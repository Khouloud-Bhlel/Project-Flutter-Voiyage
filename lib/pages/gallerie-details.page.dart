import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class GallerieDetailsPage extends StatefulWidget {
  final String image;
  GallerieDetailsPage(this.image);
  @override
  _GallerieDetailsPageState createState() => _GallerieDetailsPageState();
}
class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
  int currentPage = 1;
  int size = 10;
  List<dynamic> hits = [];
  late int totalPages;
  ScrollController _scrollController = ScrollController();
  late var galleryData;
  @override
  void initState() {
    super.initState();
    getGallerieData(widget.image);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGallerieData(widget.image);
        }
      }
    });
  }
  void getGallerieData(String image) {
    print("Image de " + image);
    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${image}&page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.galleryData = json.decode(resp.body);
        hits.addAll(galleryData['hits']);
        totalPages = (galleryData['totalHits'] / size).ceil();
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text("${widget.image}, Page ${currentPage}/${totalPages}"),
      ),
      body: galleryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: galleryData == null ? 0 : hits.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            hits[index]['tags'],
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  child: Card(
                    child: Image.network(
                      hits[index]['webformatURL'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}