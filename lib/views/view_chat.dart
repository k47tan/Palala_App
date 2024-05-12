import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/viewmodel_ai.dart';
import 'widget/widget_navbar.dart';

class RecommendationView extends StatelessWidget {
  final RecommendationController controller =
      Get.put(RecommendationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('travel recommendations'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: controller.setProvince,
              decoration: InputDecoration(
                labelText: 'Province',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: controller.setRegency,
              decoration: InputDecoration(
                labelText: 'Regency',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => controller.fetchRecommendations(),
              child: Text('Get Recommendations'),
            ),
            SizedBox(height: 16.0),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      controller.recommendationData.value!.choices[0]!.message!
                          .content!,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
