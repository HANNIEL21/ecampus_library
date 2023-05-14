import 'package:ecampus_library/export.dart';

class FacultyScreen extends StatelessWidget {
  const FacultyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    mainAxisExtent: 100,
                  ),
                  children: const [
                    CardWidget(title: "Law"),
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
