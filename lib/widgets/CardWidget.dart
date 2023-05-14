import 'package:ecampus_library/export.dart';

class CardWidget extends StatelessWidget {
  final String title;
  const CardWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 150,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage("assets/examcard.png"), fit: BoxFit.fill)),
        child: Column(
          children: [
            const Spacer(flex: 1,),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
