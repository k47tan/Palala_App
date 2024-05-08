import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../viewmodels/viewmodel_place.dart';
import '../../viewmodels/viewmodels_auth.dart';

// ignore: must_be_immutable
class AdminAddView extends StatelessWidget {
  final PlaceViewModel _placeViewModel = Get.put(PlaceViewModel());
  final AuthUser authUser = Get.find<AuthUser>();
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  File? _imageFile;

  AdminAddView({super.key});

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    }
  }

  Future<void> _savePlace() async {
    if (_imageFile == null) {
      // Menampilkan pesan kesalahan jika gambar belum dipilih
      Get.snackbar('Error', 'Please select an image.');
      return;
    }

    _placeViewModel.addPlace(
      nameController.text,
      descriptionController.text,
      _imageFile!,
      locationController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              Get.offNamed('/admin-home');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              ElevatedButton(
                onPressed: _getImage,
                child: Text('Select Image'),
              ),
              _imageFile != null ? Image.file(_imageFile!) : Container(),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              ElevatedButton(
                onPressed: _savePlace,
                child: Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
