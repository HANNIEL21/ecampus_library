import 'package:ecampus_library/export.dart';

class ExamScreen1 extends StatelessWidget {
  const ExamScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BrainfriendController>(
        builder: (context, controller, child) {
          return Scaffold(
            body: controller.response.isLoading
                ?  Center(
              child: const CircularProgressIndicator(),
            )
                : Scaffold(
              body: displayContent(controller),
            ),
          );
        });
  }

  Widget displayContent(BrainfriendController controller){
    final data = controller.response.data as ContentResponse?;
    if (data == null) {
      return Container(); //error widget
    }
    final categories = data.getCategories();
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),

          );
        });
  }
}
