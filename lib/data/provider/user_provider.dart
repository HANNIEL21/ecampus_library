import 'package:ecampus_library/data/service/dao/user_dao.dart';
import 'package:ecampus_library/data/service/repositories/user_repository.dart';
import 'package:ecampus_library/export.dart';

import 'helper/provider_response.dart';

class UserProvider extends BaseProvider {
  ProviderResponse _response = const ProviderResponse();

  ProviderResponse get response => _response;
  UserDao repository = UserRepository();

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
