import 'package:ecampus_library/export.dart';

extension RouteExtention on BuildContext {
  Future<T?> push<T>(Widget page) => Navigator.push<T>(
    this,
    RouteHelper.fadeThrough(() => page),
  );

  Future<T?> replace<T>(Widget page) => Navigator.pushReplacement(
    this,
    RouteHelper.fadeThrough(() => page),
  );

  Future<T?> pushOff<T>(Widget page) => Navigator.pushAndRemoveUntil<T>(
    this,
    RouteHelper.fadeThrough(
          () => page,
    ),
        (_) => false,
  );

  void popOff([String? routeTag]) => Navigator.popUntil(
      this, ModalRoute.withName(routeTag ?? '/AppScaffoldPage'));

  Future<bool> pop<T>([T? result]) => Navigator.maybePop(this, result);
}