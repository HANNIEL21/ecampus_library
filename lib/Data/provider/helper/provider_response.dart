import 'package:ecampus_library/data/provider/helper/base_helper.dart';

class ProviderResponse {
  final bool isLoading;
  final String? error;
  final BaseHelper? data;

  const ProviderResponse({this.isLoading = false, this.error, this.data});
}
