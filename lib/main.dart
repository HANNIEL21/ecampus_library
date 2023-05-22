import 'dart:developer';
import 'package:ecampus_library/export.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => BrainfriendController()..getCategories()),
    ChangeNotifierProvider(create: (_) => AuthProvider()..init()),
    ChangeNotifierProvider(create: (_) => UserProvider()..init()),
    Provider<BuildContext>(create: (c) => c),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

/*

List<TestUser> model = [
  TestUser(
      password: 'testAdmin1',
      model: UserModel(
        userName: 'admin1',
        displayName: 'admin',
        email: 'testadmin1@gmail.com',
        phone: "1234567890",
        category: UserCategory.ADMIN,
        level: EducationLevel.MASTERS,
        school: 'icss',
        country: 'nigeria',
        gender: 'male',
      )), // admin
  TestUser(
      password: 'testAuthor1',
      model: UserModel(
        userName: 'author1',
        displayName: 'author',
        email: 'testauthor1@gmail.com',
        phone: "1234567890",
        category: UserCategory.AUTHOR,
        level: EducationLevel.UNIVERSITY,
        school: 'icss',
        country: 'nigeria',
        gender: 'male',
      )), //author
  TestUser(
      password: 'testStudent1',
      model: UserModel(
        userName: 'student1',
        displayName: 'student1',
        email: 'teststudent1@gmail.com',
        phone: "1234567890",
        category: UserCategory.STUDENT,
        level: EducationLevel.OLEVEL_TO_JAMB,
        school: 'icss',
        country: 'nigeria',
        gender: 'female',
      )), // student
  TestUser(
      password: 'testStudent2',
      model: UserModel(
        userName: 'student2',
        displayName: 'student2',
        email: 'teststudent2@gmail.com',
        phone: "1234567890",
        category: UserCategory.STUDENT,
        level: EducationLevel.MASTERS,
        school: 'icss',
        country: 'nigeria',
        gender: 'male',
      )), //student
  TestUser(
      password: 'testUser1',
      model: UserModel(
        userName: 'user1',
        displayName: 'user1',
        email: 'testuser1@gmail.com',
        phone: "1234567890",
        category: UserCategory.USER,
        level: EducationLevel.NONE,
        school: 'icss',
        country: 'nigeria',
        gender: 'male',
      )), //user
];
 */