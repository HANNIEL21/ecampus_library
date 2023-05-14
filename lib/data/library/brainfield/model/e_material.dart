import 'package:http/http.dart';
import 'package:ecampus_library/export.dart';


class Ematerial extends BaseHelper {
  final String url;
  final String title;

  Ematerial({required this.url, required this.title});

  factory Ematerial.fromJson(Map<String, dynamic> json) {
    return Ematerial(
      url: json['url'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': title,
    };
  }
}

class EmaterialResponse with BaseHelper{
  final List<Ematerial> materials;
  const EmaterialResponse({required this.materials});
}