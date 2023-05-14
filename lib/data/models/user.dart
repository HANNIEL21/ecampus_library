import 'package:ecampus_library/data/models/subscription_model.dart';

import '../enums.dart';
import '../provider/helper/base_helper.dart';

class FirebaseUserModel with BaseHelper {
  final String displayName;
  final String email;
  final List<String> friendRequest;
  final List<String> bookmark;

  final List<String> friends;
  final String gender;
  final EducationLevel level;
  final String phone;
  final String profileImg;
  final String school;
  final String uid;
  final String userName;
  final UserCategory category;
  final String country;
  final int createdAt;
  final SubscriptionInfo subInfo;

  const FirebaseUserModel(
      {required this.displayName,
      required this.country,
      required this.email,
      required this.uid,
      required this.category,
      required this.createdAt,
      required this.friends,
      required this.friendRequest,
      required this.bookmark,
      required this.subInfo,
      required this.userName,
      required this.profileImg,
      required this.level,
      required this.school,
      required this.phone,
      required this.gender});

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'email': email,
        'friendRequest': friendRequest,
        'bookmark': bookmark,
        'friends': friends,
        'gender': gender,
        'phone': phone,
        'profileImg': profileImg,
        'school': school,
        'uid': uid,
        'userName': userName,
        "category": category.index,
        "level": level.index,
        'subInfo': subInfo.toJson(),
        'country': country,
        'createdAt': createdAt,
      };

  FirebaseUserModel copyWith(
          {String? displayName,
          String? email,
          List<String>? friendRequest,
          List<String>? bookmark,
          List<String>? friends,
          String? gender,
          EducationLevel? level,
          String? phone,
          String? profileImg,
          String? school,
          String? uid,
          String? userName,
          UserCategory? category,
          String? country,
          int? createdAt,
          SubscriptionInfo? subInfo}) =>
      FirebaseUserModel(
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        friendRequest: friendRequest ?? this.friendRequest,
        bookmark: bookmark ?? this.bookmark,
        friends: friends ?? this.friends,
        gender: gender ?? this.gender,
        subInfo: subInfo ?? this.subInfo,
        level: level ?? this.level,
        phone: phone ?? this.phone,
        profileImg: profileImg ?? this.profileImg,
        school: school ?? this.school,
        uid: uid ?? this.uid,
        userName: userName ?? this.userName,
        category: category ?? this.category,
        country: country ?? this.country,
        createdAt: createdAt ?? this.createdAt,
      );

  static FirebaseUserModel fromJson(Map<String, dynamic> json) =>
      FirebaseUserModel(
        displayName: json['displayName'],
        email: json['email'],
        subInfo: SubscriptionInfo.fromJson(json['subInfo']),
        friendRequest: List<String>.from(json['friendRequest']),
        bookmark: List<String>.from(json['bookmark']),
        friends: List<String>.from(json['friends']),
        gender: json['gender'],
        phone: json['phone'],
        profileImg: json['profileImg'],
        school: json['school'],
        uid: json['uid'],
        userName: json['userName'],
        country: json['country'],
        createdAt: json['createdAt'] ?? DateTime.now().millisecondsSinceEpoch,
        category: UserCategory
                .values[json['category'] ?? UserCategory.USER.index //integer
            ],
        level: EducationLevel
                .values[json['level'] ?? EducationLevel.NONE.index //integer
            ],
      );
}
