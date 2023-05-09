import 'package:ecampus_library/export.dart';

class BaseHelper{

}

class UserResult with BaseHelper{
  final List<String> users;
  const UserResult({required this.users});
}
class CredentialResult with BaseHelper{
  final UserCredential user;
  const CredentialResult({required this.user});
}