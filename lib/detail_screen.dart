import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'tourism_place.dart';

class DetailScreen extends StatefulWidget {
  final int albumIdx ;

  const DetailScreen({Key? key, required this.albumIdx}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final TourismPlace tourism_place = tourismPlaceList[widget.albumIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(tourism_place.name),
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(tourism_place.imageAsset),
                    ),
                    Text(
                      tourism_place.name,
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text("LOKASI : ${tourism_place.location}",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("HARGA TIKET : ${tourism_place.ticketPrice}",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    Text("${tourism_place.openDays} | ${tourism_place.openTime}",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    SizedBox(height: 7),
                    Text(tourism_place.description,
                      style:
                      TextStyle(fontSize: 15, height: 1.5),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      ListTile(
                        // leading: Text(
                        //   "# |",
                        //   style: TextStyle(color: Colors.white),
                        // ),
                        title: Text(
                          "Gambar Tempat Wisata",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    child: SizedBox(height: 400, child: _build_tourismlist())),
              )
            ],
          )
        ]));
  }
  Widget _build_tourismlist() {
    TourismPlace tourism_place = tourismPlaceList[widget.albumIdx];
    return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text("${index + 1} "),
                        title: Text(tourism_place.imageUrls[index]),
                      ),
                      SizedBox(height: 20),
                      Image.network(tourism_place.imageUrls[index]),
                    ],
                  ),
                )
            ),
          );
        },
        itemCount: tourism_place.imageUrls.length);
  }
}
