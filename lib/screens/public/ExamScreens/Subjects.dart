import 'package:ecampus_library/export.dart';

class SubjectScreen extends StatefulWidget {
  final String classs;
  final String subjectCode;
  final String category;

  const SubjectScreen(
      {Key? key,
      required this.classs,
      required this.subjectCode,
      required this.category})
      : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrainfriendController()
        ..getTopics(
            classs: widget.classs,
            subjectCode: widget.subjectCode,
            category: widget.category),
      child: Consumer<BrainfriendController>(
        builder: (context, controller, child) {
          return Scaffold(
            body: Container(),
          );
        },
      ),
    );
  }
}
