import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailView extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String location;

  PlaceDetailView({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Place'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () {
                  launchMaps(location);
                },
                icon: Icon(Icons.map),
                label: Text('Open in Google Maps'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5E8A75),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuka Google Maps
  void launchMaps(String locationUrl) async {
    if (await canLaunch(locationUrl)) {
      await launch(locationUrl);
    } else {
      throw 'Could not launch $locationUrl';
    }
  }
}
