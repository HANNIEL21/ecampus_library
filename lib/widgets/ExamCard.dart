import 'package:ecampus_library/export.dart';

class ExamCard extends StatelessWidget {
  final String title;

  const ExamCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 400,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
                image: AssetImage("assets/examcard.png"), fit: BoxFit.fill)),
        child: Column(
          children: [
            const Spacer(flex: 1,),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 1,),
            ElevatedButton(
              onPressed: () {},
              child: Text(C.S.startExam),
            ),
            const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
