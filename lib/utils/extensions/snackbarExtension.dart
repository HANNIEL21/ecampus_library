import 'package:ecampus_library/export.dart';

extension ScaffoldExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        elevation: 2,
        backgroundColor: Colors.indigo,
        duration: const Duration(seconds: 4),
        content: Text(message),
      ),
    );
  }
}