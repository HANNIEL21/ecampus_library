import 'dart:ffi';
import 'package:ecampus_library/export.dart';

class BrainfieldController with ChangeNotifier {
  ProviderResponse _response = const ProviderResponse();

  ProviderResponse get response => _response;

  void getCategories() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();
    try {
      final result = await BrainFieldApi.getCategory(
          body: {'menu': 'userdetails', 'userid': user.uid});
      _response = ProviderResponse(data: SubjectResponse(contents: result));
      notifyListeners();
    } catch (e) {
      _response = ProviderResponse(error: e.toString());
    }
    notifyListeners();
  }

  void getTopics(
      {required String classs,
      required String subjectCode,
      required String category}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();
    try {
      final result = await BrainFieldApi.getTopics(body: {
        'subject': subjectCode,
        'userid': user.uid,
        'classs': classs,
        'category': category,
        'menu': 'showtopics'
      });
      _response = ProviderResponse(data: TopicResponse(topics: result));
      notifyListeners();
    } catch (e) {
      _response = ProviderResponse(error: e.toString());
    }
    notifyListeners();
  }

  void getEmaterial(
      {required String classs,
      required String subjectCode,
      required String category,
      bool isEnote = true}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();
    try {
      final result = await BrainFieldApi.getEmaterial(body: {
        'userid': user.uid,
        'classs': classs,
        'examtype': category,
        'menu': 'showtopics'
      }, enotes: isEnote);
      _response = ProviderResponse(data: EmaterialResponse(materials: result));
      notifyListeners();
    } catch (e) {
      _response = ProviderResponse(error: e.toString());
    }
    notifyListeners();
  }

  void startExam(
      {required String classs,
      required String subjectCode,
      required String category,
      required List<Int> topicIndex,
      required int hours,
      required int minutes,
      required int questcount}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();
    final topicIndexes = topicIndex.join("#");
    try {
      final result = await BrainFieldApi.startExam(body: {
        'userid': user.uid,
        'classs': classs,
        'category': category,
        'topicindex': topicIndexes,
        'subject': subjectCode,
        'minutes': minutes,
        'hours': hours,
        'questcount': questcount,
        'menu': 'doexam'
      });
      _response = ProviderResponse(data: result);
      notifyListeners();
    } catch (e) {
      _response = ProviderResponse(error: e.toString());
    }
    notifyListeners();
  }
}
