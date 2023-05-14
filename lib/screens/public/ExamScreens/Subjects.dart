import 'package:ecampus_library/export.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
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
                  children: const [
                    CardWidget(title: "Mathematics"),
                    CardWidget(title: "English"),
                    CardWidget(title: "Chemistry"),
                    CardWidget(title: "Physics"),
                    CardWidget(title: "Civic Education"),
                    CardWidget(title: "Biology"),

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
