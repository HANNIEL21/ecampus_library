import 'package:ecampus_library/data/provider/helper/base_helper.dart';

class Content {
  String classs;
  String code;
  String examtype;
  String subject;

  Content({required this.classs, required this.code, required this.examtype, required this.subject});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      classs: json['class'],
      code: json['code'],
      examtype: json['examtype'],
      subject: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class'] = this.classs;
    data['code'] = this.code;
    data['examtype'] = this.examtype;
    data['subject'] = this.subject;
    return data;
  }
}

class ContentResponse with BaseHelper{
  final List<Content> contents;
  const ContentResponse({required this.contents});


  List<String> getCategories(){
    final allCategories = contents.map((e) => e.examtype).toSet();
    return allCategories.toList();
  }

  //get classes by categories or exam type
  List<String> getClassesByCategory({required String category}){
    final categorySubject= contents.where((element) => element.examtype==category).map((e) => e.classs).toSet();
    return categorySubject.toList();
  }

  List<Content> getSubjectsByClass({required String classs}){
    //final categorySubject= contents.where((element) => element.classs==classs).map((e) => e.subject).toSet();
    return contents.where((element) => element.classs==classs).toList();
  }

}