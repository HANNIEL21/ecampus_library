import 'dart:developer';
import 'package:ecampus_library/export.dart';

class AuthRepository with AuthDao {
  final collections = FirebaseFirestore.instance.collection("users");

  @override
  Future<UserCredential?> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) async {
        //TODO complete registration process and insert user
        /*
        insert user to database
         */
      }).catchError((error) {
        throw Exception(error.toString());
      });

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FirebaseUserModel?> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .catchError((e) {
        throw Exception(e.toString()); // send error to provider
      });

      final user = userCredential.user;
      if (user == null) {
        throw Exception('Credential not found');
      }

      final userId = user.uid;
      final firebaseUser = await collections.doc(userId).get();
      if (!firebaseUser.exists) {
        throw Exception('User not found');
      }

      final data = firebaseUser.data();
      if (data == null) {
        throw Exception("user not found");
      }
      return FirebaseUserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  ///this is use to call user authState Listener if user is still log in or out
  @override
  Future<User?> initializeFlutterFire() async {
    User? user;
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        user = user;
      });
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> changePassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    final user = FirebaseAuth.instance.currentUser;
    bool operationStatus = false;
    final cred = EmailAuthProvider.credential(email: email, password: password);

    user?.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((value) async {
        log('Firebase password Successfully changed AuthRepository line......>>89');

        operationStatus = true;
      }).catchError((err) {
        log('failed to change password $err AuthRepository line......>>93');
        operationStatus = false;
      });
    }).catchError((err) {
      log('failed to change password $err AuthRepository line......>>87');

      operationStatus = false;
    });
    return operationStatus;
  }

  @override
  Future<void> sendOtp(
      {required String phoneNumber,
      required Function(String?) callback}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (String verificationId, int? resendToken) async {
        callback(verificationId);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {
        //throw Exception(error.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<void> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> createTestUser(
      {required String password, required UserModel model}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(email: model.email!, password: password)
        .then((value) async {
      final user = value.user;
      if (user == null) {
        return;
      }
      final newUser = model.copyOf(
          uuid: user.uid,
          email: model.email,
          displayName: model.displayName,
          userName: model.userName,
          school: model.school,
          level: model.level,
          subInfo: model.subInfo,
          friendRequest: model.friendRequest,
          friends: model.friends,
          bookmark: model.bookmark,
          profileImg: model.profileImg);
      await collections.doc(user.uid).set(newUser.toJson()).then((value) {
        log('user created');
      }).catchError((e) {
        log(e.toString());
      });
    });
  }
}
