import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../models/model_place.dart';

class PlaceViewModel extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  // Menambahkan tempat baru
  Future<void> addPlace(
      String name, String description, File imageFile, String location) async {
    String? imageUrl = await uploadImage(imageFile);
    if (imageUrl != null) {
      try {
        // Membuat objek Place
        Place place = Place(
          name: name,
          description: description,
          image: imageUrl,
          location: location,
        );

        // Simpan data tempat ke Firestore
        await _firestore.collection('places').add(place.toMap());
        Get.snackbar('Success', 'Place uploaded successfully.');
        Get.offNamed('/admin-home');
      } catch (e) {
        Get.snackbar('Error', 'Failed to upload place: $e');
      }
    } else {
      Get.snackbar('Error', 'Failed to upload image.');
    }
  }

  // Mengunggah gambar ke Firebase Storage
  Future<String?> uploadImage(File imageFile) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await ref.putFile(imageFile);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  // Menghapus tempat dari Firestore berdasarkan ID
  Future<void> deletePlace(String placeId) async {
    try {
      await _firestore.collection('places').doc(placeId).delete();
      Get.snackbar('Success', 'Place deleted successfully.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete place: $e');
    }
  }

  // Mendapatkan semua tempat dari Firestore
  Stream<List<Place>> getPlaces() {
    try {
      return _firestore.collection('places').snapshots().map((snapshot) =>
          snapshot.docs
              .map((doc) =>
                  Place.fromMap(doc.data() as Map<String, dynamic>, doc.id))
              .toList());
    } catch (e) {
      print("Error getting places: $e");
      return Stream.empty();
    }
  }
}
