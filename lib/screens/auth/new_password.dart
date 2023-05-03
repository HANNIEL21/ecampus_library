import 'package:ecampus_library/export.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            child: SingleChildScrollView(
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
                              C.S.recoverPassword,
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w600),
                            ),

                            // Spacing
                            const SizedBox(
                              height: 30,
                            ),

                            const Text(
                              "Enter your email or registered phone number to get a password reset pin",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: 30,
                            ),

                            // enter password field
                            CustomTextField(
                              controller: passwordTextController,
                              icon: Icons.lock,
                              HintText: C.S.enterNewPassword,
                              color: Colors.indigo,
                              obscure: true,
                              type: TextInputType.emailAddress,
                            ),

                            // Spacing
                            const SizedBox(
                              height: 30,
                            ),

                            // Confirm password field
                            CustomTextField(
                              controller: newPasswordTextController,
                              icon: Icons.lock,
                              HintText: C.S.confirmNewPassword,
                              color: Colors.indigo,
                              obscure: true,
                              type: TextInputType.emailAddress,
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
                                backgroundColor: const MaterialStatePropertyAll(
                                  Colors.indigo,
                                ),
                                textStyle: const MaterialStatePropertyAll(
                                  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              onPressed: () {
                                context.push(const AuthScreen());
                              },
                              child: Text(
                                C.S.verify,
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
