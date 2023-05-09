
import 'dart:io';

import '../../models/user.dart';
import '../../models/user_model.dart';

abstract class UserDao{

  Future uploadImage({required File image});

  Future  storeUserInfo(
      selectedImage,
      firstName,
      lastName,
      email,
      phone,
      countryValue,
      genderValue,
      classValue,
      schoolValue,
      category,
      );

  Future<void> updateSubInfo(FirebaseUserModel user);
  Future<FirebaseUserModel> getUserInfo();


}