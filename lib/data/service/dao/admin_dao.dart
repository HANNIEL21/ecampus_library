import 'package:ecampus_library/export.dart';

abstract class AdminDao {
  Future<List<UserModel>> getUserByCategory({required UserCategory category});

  Future assignAdmin({required String uuid});

  Future removeFromAdmin({required String uuid});

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
}
