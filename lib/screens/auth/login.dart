import 'dart:developer';

import 'package:ecampus_library/utils/extensions/routeExtension.dart';
import 'package:flutter/material.dart';
import 'package:ecampus_library/export.dart';

class LoginScreen extends StatefulWidget {
  final Function() onClickToggle;
  LoginScreen({Key? key, required this.onClickToggle}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text:"testuser1@gmail.com");
  TextEditingController passwordController = TextEditingController(text:"testUser1");

  String? loginError;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login(AuthProvider provider) async {
    final email = emailController.text;
    final password = passwordController.text;

    if(email == "" || password == ""){
      context.showSnackBar("All fields are required");
      return;
    }

    provider.login(
        email: email,
        password: password,
        callback: (result) {
          final response = result;
          if (response.error != null) {
            //TODO handle error
            setState(() {
              loginError = response.error;
              context.showSnackBar(response.error.toString());
            });
            return;
          }


          setState(() {
            isLoading = response.isLoading;
          });

          if (response.data != null) {
            final data = response.data as FirebaseUserModel;
            final category = data.category;
            context.push(const AppRoot());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Form(child: Consumer<AuthProvider>(
            builder: (context, controller, child) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Form
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text
                              Text(
                                C.S.logIn,
                                style: const TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w600),
                              ),

                              // Spacing
                              const SizedBox(
                                height: 30,
                              ),

                              // Email field
                              CustomTextField(
                                controller: emailController,
                                icon: Icons.mail,
                                HintText: C.S.enterEmail,
                                color: Colors.indigo,
                                obscure: false,
                                type: TextInputType.emailAddress,
                              ),

                              // Spacing
                              const SizedBox(
                                height: 25,
                              ),

                              // Password
                              CustomTextField(
                                controller: passwordController,
                                icon: Icons.lock,
                                HintText: C.S.enterPassword,
                                color: Colors.indigo,
                                obscure: true,
                                type: TextInputType.visiblePassword,
                              ),

                              // Spacing
                              const SizedBox(
                                height: 20,
                              ),

                              // Forgot password
                              InkWell(
                                onTap: () {
                                  context.push(const RecoverPasswordScreen());
                                },
                                child: Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    text: C.S.forgotPassword,
                                  ),
                                ),
                              ),

                              // Spacing
                              const SizedBox(
                                height: 50,
                              ),

                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  fixedSize: const MaterialStatePropertyAll(
                                    Size(400, 50),
                                  ),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Colors.indigo,
                                  ),
                                  textStyle: const MaterialStatePropertyAll(
                                    TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                                onPressed: () => login(controller),
                                child: isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        C.S.logIn,
                                      ),
                              ),

                              // Spacing
                              const SizedBox(
                                height: 50,
                              ),

                              // don't have an account
                              InkWell(
                                onTap: widget.onClickToggle,
                                child: Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                    text: "Don't have an account ",
                                    children: [
                                      TextSpan(
                                        text: C.S.singUp,
                                        style: const TextStyle(
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
