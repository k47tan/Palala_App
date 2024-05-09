import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model_place.dart';
import '../viewmodels/viewmodel_place.dart';
import 'view_detail_place.dart';
import 'widget/widget_navbar.dart';

class HomeView extends StatelessWidget {
  final PlaceViewModel _placeViewModel = Get.put(PlaceViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Place>>(
        stream: _placeViewModel.getPlaces(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Place>? places = snapshot.data;
            return ListView.builder(
              itemCount: places!.length,
              itemBuilder: (context, index) {
                double itemWidth = MediaQuery.of(context).size.width * 0.8;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: itemWidth,
                    child: PlaceItem(places[index]), // Pass Place object
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}

class PlaceItem extends StatelessWidget {
  final Place place;

  const PlaceItem(this.place, {Key? key})
      : super(key: key); // Add key parameter

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to PlaceDetailView and pass necessary parameters
        Get.to(PlaceDetailView(
          imageUrl: place.image.toString(),
          name: place.name.toString(),
          description: place.description.toString(),
          location: place.location.toString(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                place.image.toString(),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                place.name.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
