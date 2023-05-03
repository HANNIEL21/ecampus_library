import 'package:ecampus_library/screens/auth/login.dart';
import 'package:ecampus_library/screens/auth/signup.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  void toggle() => setState(() => isLogin = !isLogin);

  @override
  Widget build(BuildContext context) {
    return handleAuth();
  }

  Widget handleAuth() {
    if (isLogin) {
      return LoginScreen(onClickToggle: toggle);
    }
    return SignupScreen(onClickToggle: toggle);
  }
}
