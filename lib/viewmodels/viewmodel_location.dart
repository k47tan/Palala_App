import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'viewmodel_weather.dart';

class LocationViewModel extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  bool get isLoading => _isLoading.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  Future<void> getLocation() async {
    bool locationService;
    LocationPermission permission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (!locationService) {
      Get.snackbar('Error', 'Please enable location service');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permission denied forever');
      return;
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permission denied');
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      debugPrint(
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      await WeatherViewModel().fetchWeather(
        _latitude.value,
        _longitude.value,
      );

      _isLoading.value =
          false; // Pemanggilan _isLoading harus setelah mendapatkan data cuaca
    } catch (e) {
      Get.snackbar('Error', 'Failed to get location: $e');
    }
  }
}
