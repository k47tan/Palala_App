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
        title: Text('Travel Recommendations'),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5E8A75),
                foregroundColor: Colors.white,
              ),
              child: Text('Get Recommendations'),
            ),
            SizedBox(height: 16.0),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else if (controller.recommendationData.value == null) {
                return Text('');
              } else {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Flexible(
                              child: Text(
                                controller.recommendationData.value!.choices[0]!
                                    .message!.content!, // Response text
                                textAlign: TextAlign.justify,
                                style:
                                    TextStyle(fontSize: 16.0, letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      ],
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
