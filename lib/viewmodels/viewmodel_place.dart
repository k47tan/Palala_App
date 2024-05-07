import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../models/model_place.dart';

class PlaceViewModel extends GetxController {
  final _firestore = FirebaseFirestore.instance;

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
      } catch (e) {
        Get.snackbar('Error', 'Failed to upload place: $e');
      }
    } else {
      Get.snackbar('Error', 'Failed to upload image.');
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      // Unggah gambar ke Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await ref.putFile(imageFile);

      // Dapatkan URL gambar yang diunggah
      String imageUrl = await ref.getDownloadURL();

      // Kembalikan URL gambar
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
