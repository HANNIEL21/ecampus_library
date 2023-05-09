import 'package:ecampus_library/export.dart';

class AuthProvider extends BaseProvider {
  ProviderResponse _response = const ProviderResponse();

  ProviderResponse get response => _response;
  AuthDao repository = AuthRepository() as AuthDao;
  UserCategory? _category;

  UserCategory? get category => _category;

  init() async {
    _category = await Preference.getCategory();
    notifyListeners();
  }

  void login(
      {required String email,
      required String password,
      required Function(ProviderResponse) callback}) async {
    _response = const ProviderResponse(
        isLoading: true); // notify the UI for loading event
    notifyListeners();
    try {
      final user = await repository.login(email: email, password: password);
      _response = ProviderResponse(data: user);

      if (user == null) {
        return;
      }

      await Preference.saveCategory(user.category!);

      callback(_response);
    } catch (e) {
      _response = ProviderResponse(error: e.toString());

      callback(_response);
    }
    notifyListeners();
  }

  void createAccount() async {}

  logout({required Function callback}) async {
    await repository.logout();
    callback();
  }
}
