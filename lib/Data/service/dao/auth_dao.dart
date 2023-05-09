import 'package:ecampus_library/export.dart';


abstract class AuthDao {
  Future createAccount({required String email, required String password});

  Future<FirebaseUserModel?> login({required String email, required String password});

  Future<void> changePassword(
      {required String email,
      required String password,
      required String newPassword});

  Future<User?> initializeFlutterFire();

  Future<void> logout();

  Future<void> sendOtp(
      {required String phoneNumber, required Function(String?) callback});

  Future<void> resetPassword({required String email});

  Future<void> createTestUser(
      {required String password, required UserModel model});
/*TODO
      declare methods for verify otp and insert user
      and implement method in your repository
   */
}
