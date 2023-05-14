import 'package:ecampus_library/export.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.app.brainfriendonline.com/bf-fetch-example.php";
const token = "apikey=2353282";

class BrainFieldApi {

  //use this to get videos and e
  static Future<List<Ematerial>> getEmaterial(
      {required Map<String, dynamic> body,bool enotes=true}) async {
    final response = await baseRequest(body: body);

    String key = 'enotes';
    if(!enotes){
      key='videos';
    }
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedBody = jsonDecode(responseBody);
      final topics = decodedBody[key]as List;

     return topics.map((e) => Ematerial.fromJson(e)).toList();
    }
    throw Exception('Unable to fetch data');
  }

  //start exam
 static Future<Exam> startExam(
      {required Map<String, dynamic> body}) async {
    final response = await baseRequest(body: body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedBody = jsonDecode(responseBody);

     return Exam.fromJson(decodedBody);
    }
    throw Exception('Unable to fetch data');
  }

  static Future<List<Topic>> getTopics(
      {required Map<String, dynamic> body}) async {
    final response = await baseRequest(body: body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedBody = jsonDecode(responseBody);
      final topics = decodedBody['topics']as List;

     return topics.map((e) => Topic.fromJson(e)).toList();
    }
    throw Exception('Unable to fetch data');
  }
  static Future<List<Content>> getCategory(
      {required Map<String, dynamic> body}) async {
    final response = await baseRequest(body: body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedBody = jsonDecode(responseBody);
      final details = decodedBody['details'];
      final contents = details['contents'];
      final subjects = contents['subjects'] as List;

     return subjects.map((e) => Content.fromJson(e)).toList();
    }
    throw Exception('Unable to fetch data');
  }

 static  Future<http.Response> baseRequest(
      {required Map<String, dynamic> body}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'AUTHORIZATION': token
        },
        body: body);

    return response;
  }
}
