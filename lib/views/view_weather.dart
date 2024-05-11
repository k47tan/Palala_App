import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/viewmodel_location.dart';
import '../viewmodels/viewmodel_weather.dart';
import 'widget/widget_navbar.dart';

class WeatherView extends StatelessWidget {
  final LocationViewModel _locationViewModel = Get.put(LocationViewModel());
  final WeatherViewModel _weatherViewModel = Get.put(WeatherViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (_locationViewModel.isLoading) {
                // Menampilkan indikator loading saat sedang memuat lokasi
                return CircularProgressIndicator();
              } else {
                // Setelah lokasi tersedia, panggil getWeather untuk mendapatkan cuaca
                _weatherViewModel.fetchWeather(
                  _locationViewModel.latitude,
                  _locationViewModel.longitude,
                );

                // Tampilkan data cuaca saat sudah tersedia
                return Obx(() {
                  if (_weatherViewModel.weather.value != null) {
                    return Column(
                      children: [
                        Text(
                          'Current Weather:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Image.network(iconUrl(_weatherViewModel
                            .weather.value!.weather![0].icon!)),
                        Text(
                          'City: ${_weatherViewModel.weather.value!.name}',
                        ),
                        Text(
                          'Temperature: ${_weatherViewModel.weather.value!.main!.temp}°C',
                        ),
                        Text(
                          'Description: ${_weatherViewModel.weather.value!.weather![0].description}',
                        ),
                        // Add more weather data fields as needed
                      ],
                    );
                  } else {
                    return SizedBox(); // Jangan tampilkan jika data cuaca masih null
                  }
                });
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
