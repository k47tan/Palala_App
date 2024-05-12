import 'message.dart';

class Choice {
  Choice({
    required this.index,
    this.longrobs,
    required this.finishReason,
    required this.message,
  });

  String? text;
  int? index;
  dynamic longrobs;
  String? finishReason;
  Message? message;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json["index"],
        longrobs: json["longrobs"],
        finishReason: json["finish_reason"],
        message: Message.fromJson(json["message"]),
      );

  get content => null;

  Map<String, dynamic> toJson() => {
        "index": index,
        "longrobs": longrobs,
        "finish_reason": finishReason,
        "message": message!.toJson(),
      };
}
