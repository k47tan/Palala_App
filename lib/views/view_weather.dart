import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widget/widget_navbar.dart';

class WeatherView extends StatelessWidget {
  WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Text('Welcome to Weather, Comming son',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
