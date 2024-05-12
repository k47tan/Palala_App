// recommendation_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/open-ai/ai.dart';
import '../services/recomendation_aI_services.dart';

class RecommendationController extends GetxController {
  var province = ''.obs;
  var regency = ''.obs;
  var recommendationData = Rxn<GptData>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var result = ''.obs;

  void setProvince(String value) {
    province.value = value;
  }

  void setRegency(String value) {
    regency.value = value;
  }

  Future<void> fetchRecommendations() async {
    isLoading.value = true;
    try {
      final data = await RecommendationService.getRecommendations(
        province: province.value,
        regency: regency.value,
      );
      recommendationData.value = data;
      debugPrint(
          'Data: ${recommendationData.value?.choices[0]!.message!.content!}');
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = 'Failed to load data: $e';
      debugPrint('Failed to load data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
