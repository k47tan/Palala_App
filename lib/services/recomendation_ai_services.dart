import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/open-ai/ai.dart';
import '../models/open-ai/usage.dart';

class RecommendationService extends GetConnect {
  static Future<GptData?> getRecommendations({
    required String province,
    required String regency,
  }) async {
    late GptData data = GptData(
      id: '',
      object: '',
      created: 0,
      model: '',
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${dotenv.env['OPENAI_API_KEY']}',
      };

      final requestData = jsonEncode(
        {
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are an AI assistant that is useful for finding tourist attractions in Indonesia',
            },
            {
              'role': 'user',
              'content':
                  'I am looking for location in province $province, regency $regency.',
            },
            {
              'role': 'assistant',
              'content': 'I can help you with that?',
            },
          ],
          'max_tokens': 150,
        },
      );

      var response = await http.post(
        url,
        headers: headers,
        body: requestData,
      );
      print("ini merupakan hasil dari service recomendation_service.dart");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        data = gptDataFromJson(response.body);
      } else {
        debugPrint('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }

    return data;
  }
}
