import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:ecampus_library/export.dart';

class UserRepository with UserDao {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;
  FirebaseStorage store = FirebaseStorage.instance;

  @override
  Future<FirebaseUserModel> getUserInfo() async {
    String uid = auth.currentUser!.uid;

    try {
      final snapshot = await doc.collection("users").doc(uid).get();

      if (!snapshot.exists) {
        throw Exception('User not found');
      }
      final data = snapshot.data();
      if (data == null) {
        throw Exception('User not found');
      }
      final result = FirebaseUserModel.fromJson(data);

      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future storeUserInfo(selectedImage, firstName, lastName, email, phone,
      countryValue, genderValue, classValue, schoolValue, category) async {
    String url = await uploadImage(image: selectedImage);

    // Date

    String uid = auth.currentUser!.uid;

    final user = FirebaseUserModel(
      uid: uid,
      subInfo: SubscriptionInfo.subscribe(),
      profileImg: url,
      userName: firstName + lastName,
      displayName: '',
      email: email,
      phone: phone,
      category: category,
      country: countryValue,
      level: classValue,
      school: schoolValue,
      gender: genderValue,
      friends: [],
      friendRequest: [],
      bookmark: [],
      createdAt: DateTime.now().millisecondsSinceEpoch,
    ).toJson();

    // TODO: implement storeUserInfo
    try {
      doc.collection("users").doc(uid).set(user);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future uploadImage({required File image}) async {
    String imageUrl = "";
    String fileName = Path.basename(image.path);
    final ref = store.ref().child("user/$fileName");

    // TODO: implement uploadImage
    try {
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      await taskSnapshot.ref.getDownloadURL().then((value) {
        imageUrl = value;
      });
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updateSubInfo(FirebaseUserModel user) async {
    final sub = SubscriptionInfo.updateSubscription(
        currentSubscriptionInfo: user.subInfo);
    final model = user.copyWith(subInfo: sub);
    await doc.collection("users").doc(user.uid).update(model.toJson());
  }
}
