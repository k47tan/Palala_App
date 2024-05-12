import 'dart:convert';

import 'choice.dart';
import 'usage.dart';

GptData gptDataFromJson(String str) => GptData.fromJson(json.decode(str));

String gptDataToJson(GptData data) => json.encode(data.toJson());

class GptData {
  GptData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice?> choices;
  Usage? usage;

  factory GptData.fromJson(Map<String, dynamic> json) => GptData(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: (json["choices"] != null)
            ? List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x)))
            : [],
        usage: Usage.fromJson(json["usage"]),
      );

  get content => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x!.toJson())),
        "usage": usage!.toJson(),
      };
}
