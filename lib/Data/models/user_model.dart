import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/provider/helper/base_helper.dart';

import '../enums.dart';

class UserModel with BaseHelper {
  String? uuid;
  String? userName;
  String? displayName;
  String? email;
  String? phone;
  UserCategory? category;
  String? profileImg;
  EducationLevel? level;
  String? school;
  String? country;
  String? gender;
  Object? subInfo;
  List<String>? friends = [];
  List<String>? bookmark = [];
  List<String>? friendRequest = [];
  int? createdAt;

  UserModel(
      {this.uuid,
      this.userName,
      this.displayName,
      this.createdAt,
      this.email,
      this.phone,
      this.profileImg,
      this.category,
      this.level,
      this.country,
      this.gender,
      this.school,
      this.friendRequest,
      this.friends,
      this.bookmark,
      this.subInfo});

  UserModel copyOf({
    String? uuid,
    String? userName,
    String? displayName,
    String? email,
    String? phone,
    UserCategory? category,
    String? profileImg,
    EducationLevel? level,
    String? school,
    String? country,
    String? gender,
    Object? subInfo,
    List<String>? friends,
    List<String>? bookmark,
    List<String>? friendRequest,
    int? createdAt,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      userName: userName ?? this.userName,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      category: category ?? this.category,
      profileImg: profileImg ?? this.profileImg,
      level: level ?? this.level,
      school: school ?? this.school,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      subInfo: subInfo ?? this.subInfo,
      friends: friends != null ? List.from(friends) : this.friends,
      bookmark: bookmark != null ? List.from(bookmark) : this.bookmark,
      friendRequest:
          friendRequest != null ? List.from(friendRequest) : this.friendRequest,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uuid,
      "userName": userName,
      "displayName": displayName,
      "email": email,
      "phone": phone,
      "gender": gender,
      "profileImg": profileImg,
      "category": category?.index ?? UserCategory.USER.index,
      "level": level?.index ?? EducationLevel.OLEVEL_TO_JAMB.index,
      "school": school,
      "country": country,
      "friends": friends,
      "friend Requests": friendRequest,
      "subscriptionInfo": subInfo,
      "bookmark": bookmark,
      "createdAt": createdAt
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        uuid: document.id,
        userName: data["username"],
        displayName: data["displayName"],
        email: data["email"],
        phone: data["phone"],
        profileImg: data["profileImg"],
        category: UserCategory
                .values[data['category'] ?? UserCategory.USER.index //integer
            ],
        level: EducationLevel
                .values[data['level'] ?? EducationLevel.NONE.index //integer
            ],
        country: data["country"],
        gender: data["gender"],
        school: data["school"],
        createdAt: data["createdAt"],
        bookmark: null,
        //data["bookmark"]??[],
        friendRequest: null,
        //data["friend requests"]??[],
        friends: null,
        // data["friends"]??[],
        subInfo: data["subscriptionInfo"]);

  }
}
