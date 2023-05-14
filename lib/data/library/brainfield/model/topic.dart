import 'package:ecampus_library/data/provider/helper/base_helper.dart';

class Topic {
  final int index;
  final String questions;
  final String theme;
  final String topic;

  Topic({required this.index, required this.questions, required this.theme, required this.topic});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      index: json['index'],
      questions: json['questions'],
      theme: json['theme'],
      topic: json['topic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'questions': questions,
      'theme': theme,
      'topic': topic,
    };
  }
}

class TopicResponse with BaseHelper{
  final List<Topic> topics;
  const TopicResponse({required this.topics});
}