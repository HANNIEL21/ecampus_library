import 'package:cloud_firestore/cloud_firestore.dart';

class ChannelModel {
  int? id;
  String? description;
  int? timeCreated;
  List<String>? members;
  List<Object>? chatDetails;
  String? type;


  ChannelModel({this.id, this.description, this.timeCreated, this.members, this.chatDetails, this.type});


  toJson(){
    return {
      "Id": id,
      "Description": description,
      "Members": members,
      "Timestamp": timeCreated,
      "Chat Details": chatDetails,
      "Type": type,
    };
  }

  factory ChannelModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return ChannelModel(
      id: data["Id"],
      description: data["Description"],
      chatDetails: data["Chat Details"],
      members: data["Members"],
      timeCreated: data["Timestamp"],
      type: data["Type"],
    );

  }

}