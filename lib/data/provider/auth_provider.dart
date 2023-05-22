import 'dart:developer';
import 'package:ecampus_library/export.dart';

class AuthProvider extends BaseProvider {
  ProviderResponse _response = const ProviderResponse();

  ProviderResponse get response => _response;
  AuthDao repository = AuthRepository();
  UserCategory? _category;

  UserCategory? get category => _category;

  init() async {
    _category = await Preference.getCategory();
    notifyListeners();
  }

  void login({
    required String email,
    required String password,
    required Function(ProviderResponse) callback,
  }) async {
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();
    try {
      final user = await repository.login(email: email, password: password);
      log("user: $user");
      _response = ProviderResponse(data: user);
      log("response: ${_response}");
      if (user == null) {
        log("user not found");
        return;
      }

      await Preference.saveCategory(user.category);

      callback(_response);
    } catch (e) {
      _response = ProviderResponse(error: e.toString());
      log(e.toString());

      callback(_response);
    }
    notifyListeners();
  }

  void createAccount(
      {required String email,
      required String password,
      // required String phoneNumber,
      required Function(ProviderResponse) callback}) async {
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();
    log("signup called");
    try {
      final user =
          await repository.createAccount(email: email, password: password);
      final _response = ProviderResponse(data: user);
      callback(_response);
    } catch (e) {
      final _response = ProviderResponse(error: e.toString());
      callback(_response);
    }
  }

  logout({required Function callback}) async {
    await repository.logout();
    callback();
  }
}
