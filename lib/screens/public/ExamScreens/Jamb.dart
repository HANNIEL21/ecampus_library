import 'package:ecampus_library/export.dart';

class JambScreen extends StatefulWidget {
  const JambScreen({Key? key}) : super(key: key);

  @override
  State<JambScreen> createState() => _JambScreenState();
}

class _JambScreenState extends State<JambScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){context.pop();}, icon: const Icon(Icons.chevron_left)),
            const Spacer(flex: 1,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExamCard(title: C.S.oldFormat,),
                  const SizedBox(height: 50,),
                  ExamCard(title: C.S.newFormat,),
                ],
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
