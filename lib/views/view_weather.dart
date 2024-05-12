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
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.JPG',
            ),
            fit: BoxFit.cover,
          ),
        ),
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
                    return Container(
                      padding: const EdgeInsets.all(20),
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 221, 233, 227),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Weather',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Image.network(
                                iconUrl(_weatherViewModel
                                    .weather.value!.weather![0].icon!),
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_weatherViewModel.weather.value!.weather![0].description}',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${_weatherViewModel.weather.value!.main!.temp}°C',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                '${_weatherViewModel.weather.value!.name}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          // Add more weather data fields as needed
                        ],
                      ),
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
