import 'dart:developer';

import 'package:ecampus_library/export.dart';

class SignupScreen extends StatefulWidget {
  final Function() onClickToggle;
  SignupScreen({Key? key, required this.onClickToggle}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController(text: "testUser1@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "testUser1");

  signup(AuthProvider provider) {
    final email = emailController.text;
    final password = passwordController.text;
    final phoneNumber = phoneController.text;

    if(emailController.text == "" && passwordController.text == ""){
      context.showSnackBar("all fields are required");
    }

    provider.createAccount(
        email: email,
        password: password,
        callback: (result) {
          final response = result;
          print(response.data);
          if (response.error != null) {
            setState(() {
              context.showSnackBar(response.error.toString());
            });
            return;
          }

          if(response.data != null){
            final data = response.data;
            context.showSnackBar(" $data signed in successfully ");
            context.push(const EditProfileScreen());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            child: Consumer<AuthProvider>(
              builder: (context, controller, child) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Form
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  C.S.singUp,
                                  style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600),
                                ),

                                // Spacing
                                const SizedBox(
                                  height: 25,
                                ),

                                const Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                        color: Colors.indigo, fontSize: 15),
                                    text:
                                        "By creating an account, you agree to our",
                                    children: [
                                      TextSpan(
                                          text: " Terms",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: " and"),
                                      TextSpan(
                                          text: " Conditions",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),

                                // Spacing
                                const SizedBox(
                                  height: 25,
                                ),

                                // TODO: email text field
                                CustomTextField(
                                  icon: Icons.mail,
                                  HintText: C.S.enterEmail,
                                  color: Colors.indigo,
                                  controller: emailController,
                                  obscure: false,
                                  type: TextInputType.emailAddress,
                                ),

                                // Spacing
                                const SizedBox(
                                  height: 25,
                                ),

                                // Phone Field
                                CustomTextField(
                                  icon: Icons.phone,
                                  HintText: C.S.enterPhone,
                                  color: Colors.indigo,
                                  controller: phoneController,
                                  obscure: false,
                                  type: TextInputType.number,
                                ),

                                // Spacing
                                const SizedBox(
                                  height: 25,
                                ),

                                // TODO: Password text field
                                CustomTextField(
                                  icon: Icons.lock,
                                  HintText: "Enter Password",
                                  color: Colors.indigo,
                                  obscure: true,
                                  type: TextInputType.visiblePassword,
                                  controller: passwordController,
                                ),

                                // Spacing
                                const SizedBox(
                                  height: 20,
                                ),

                                Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                        color: Colors.indigo, fontSize: 15),
                                    text: C.S.verificationCode,
                                  ),
                                ),

                                // Spacing
                                const SizedBox(
                                  height: 50,
                                ),

                                // TODO: create Sign Up Button
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  onPressed: () {
                                    signup(controller);
                                  },
                                  child: const Text(
                                    "Sign Up",
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
                                          color: Colors.indigo, fontSize: 15),
                                      text: C.S.alreadyHaveAnAccount,
                                      children: [
                                        TextSpan(
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            text: C.S.logIn)
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
            ),
          );
        },
      ),
    );
  }
}
