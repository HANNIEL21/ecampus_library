import 'package:ecampus_library/data/provider/helper/base_helper.dart';

class Exam  with BaseHelper{
  final String url;
  final String status;
  final int statusCode;

  Exam({required this.url, required this.status, required this.statusCode});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      url: json['url'],
      status: json['status'],
      statusCode: json['statuscode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'status': status,
      'statuscode': statusCode,
    };
  }
}

