import 'package:ecampus_library/export.dart';

class UserProvider extends BaseProvider {
  ProviderResponse _response = const ProviderResponse();

  ProviderResponse get response => _response;
  UserDao repository = UserRepository() as UserDao;

  init() {
    getUserDetails();
  }

  Future getUserDetails() async {
    _response = const ProviderResponse(isLoading: true);
    notifyListeners();

    try {
      final result = await repository.getUserInfo();
      _response = ProviderResponse(data: result);
      notifyListeners();
      repository.updateSubInfo(
          result); //update subscription status each time the user first opens the app
    } catch (e) {
      _response = ProviderResponse(error: e.toString());
    }
    notifyListeners();
  }
}
