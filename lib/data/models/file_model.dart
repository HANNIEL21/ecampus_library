import 'package:cloud_firestore/cloud_firestore.dart';

class FileModel {
  String? id;
  String? name;
  String? author;
  int? timeStamp;
  int? age;
  String? coverImg;
  String? fileUrl;
  String? category;


  FileModel({this.id, this.name, this.age, this.author, this.timeStamp, this.category, this.fileUrl, this.coverImg});


  toJson(){
    return {
      "Id": id,
      "Name": name,
      "Category": category,
      "Age": age,
      "Timestamp": timeStamp,
      "Author": author,
      "File Url": fileUrl,
      "Cover Image": coverImg,
    };
  }

  factory FileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return FileModel(
      id: data["Id"],
      age: data["Age"],
      author: data["Author"],
      coverImg: data["Cover Image"],
      timeStamp: data["Timestamp"],
      category: data["Category"],
      fileUrl: data["File Url"],
      name: data["Name"],
    );

  }

}