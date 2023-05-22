import 'package:ecampus_library/export.dart';

class BaseHelper{

}
class CreateAccountUserResult extends BaseHelper{
  final UserCredential credential;
   CreateAccountUserResult({required this.credential});
}
class UserResult with BaseHelper{
  final List<String> users;
  const UserResult({required this.users});
}
class CredentialResult with BaseHelper{
  final UserCredential user;
  const CredentialResult({required this.user});
}