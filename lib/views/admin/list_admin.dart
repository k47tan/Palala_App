import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/viewmodels_auth.dart';
import '../../models/model_place.dart';
import '../../viewmodels/viewmodel_place.dart';

class AdminHomeView extends StatelessWidget {
  final PlaceViewModel _placeViewModel = Get.put(PlaceViewModel());
  final AuthUser authUser = Get.find<AuthUser>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () {
              authUser.signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Place>>(
        stream: _placeViewModel.getPlaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Place> places = snapshot.data ?? [];
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          Place place = places[index];
                          return Card(
                            color: Colors.grey[300],
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              dense: true, // Kerapatan konten
                              leading: Image.network(place.image.toString()),
                              title: Text(
                                place.name.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(place.description.toString()),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _showDeleteDialog(
                                      context, place.id.toString());
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Pindah ke halaman tambah
                        Get.offNamed('/admin-add');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5E8A75),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Add'),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String placeId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Place'),
        content: Text('Are you sure you want to delete this place?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _placeViewModel.deletePlace(placeId);
              Get.back();
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
