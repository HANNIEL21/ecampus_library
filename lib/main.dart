import 'dart:developer';
import 'package:ecampus_library/export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    final result = await BrainFieldApi.getCategory(
        body: {'menu': 'userdetails', 'userid': 'student'});
    log("successful ${result.length}");
  } catch (e) {
    log(e.toString());
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()..init()),
    ChangeNotifierProvider(create: (_) => UserProvider()..init()),
    Provider<BuildContext>(create: (c) => c),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    );
  }
}
