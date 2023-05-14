import 'package:ecampus_library/export.dart';

class ExamScreen1 extends StatelessWidget {
  const ExamScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                children: [
                  ClassTile(
                    icon: Icons.book,
                    title: "Jamb",
                    ontap: ()=> context.push(const JambScreen()),
                  ),
                  ClassTile(
                    icon: Icons.file_present,
                    title: "Post-Utme",
                    ontap: ()=> context.push(const PostUtmeScreen()),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
