import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? id;
  String? userId;
  String? channelId;
  String? messageBody;
  int? timeStamp;
  String? state;
  String? fileUrl;
  String? type;


  MessageModel({this.id, this.userId, this.channelId, this.messageBody, this.timeStamp, this.state, this.fileUrl, this.type});


  toJson(){
    return {
      "Id": id,
      "UserUd": userId,
      "ChannelId": channelId,
      "Message Body": messageBody,
      "Timestamp": timeStamp,
      "state": state,
      "File Url": fileUrl,
      "Type": type,
    };
  }

  factory MessageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return MessageModel(
      id: data["Id"],
      userId: data["UserId"],
      channelId: data["channelId"],
      messageBody: data["Message Body"],
      timeStamp: data["Timestamp"],
      type: data["Type"],
      fileUrl: data["File Url"],
      state: data["State"],
    );

  }

}