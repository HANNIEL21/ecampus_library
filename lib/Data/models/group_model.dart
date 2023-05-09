

import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  int? id;
  String? name;
  String? description;
  int? timeCreated;
  List<String>? members;
  String? groupIcon;
  String? channelId;
  String? studyMaterial;


  GroupModel({this.id, this.name, this.channelId, this.description, this.groupIcon, this.members, this.studyMaterial, this.timeCreated});


  toJson(){
    return {
      "id": id,
      "name": name,
      "channelId": channelId,
      "description": description,
      "groupIcon": groupIcon,
      "studyMaterial": studyMaterial,
      "members": members,
      "timeCreated": timeCreated,
    };
  }

  factory GroupModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return GroupModel(
      id: data["id"],
      name: data["name"],
      channelId: data["channelId"],
      description: data["description"],
      groupIcon: data["groupIcon"],
      members: data["members"],
      studyMaterial: data["studyMaterial"],
      timeCreated: data["timeCreated"],
    );

  }

}