import 'package:ecampus_library/export.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  const Text(
                    "Welcome Back, Tams",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 150,
                    ),
                    children: [
                      ClassTile(
                        icon: Icons.book,
                        title: "E-Books",
                        ontap: ()=> context.push(const ExamScreen()),
                      ),
                      ClassTile(
                        icon: Icons.file_present,
                        title: "Exam",
                        ontap: ()=> context.push(const ExamScreen()),
                      ),
                      ClassTile(
                        icon: Icons.video_file,
                        title: "Video",
                        ontap: ()=> context.push(const VideoScreen()),
                      ),
                      ClassTile(
                        icon: Icons.file_present,
                        title: "Currculum",
                        ontap: ()=> context.push(const Curriculum()),
                      ),
                      ClassTile(
                        icon: Icons.file_present,
                        title: "Games",
                        ontap: ()=> context.push(const GamesScreen()),
                      ),
                      ClassTile(
                        icon: Icons.file_present,
                        title: "Daily Tasks",
                        ontap: ()=> context.push(const DailyTask()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
