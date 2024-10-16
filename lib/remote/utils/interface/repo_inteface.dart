import 'package:flutter_starter/remote/utils/response/api_response.dart';

abstract class RepoAbstract {
  Future<ApiResponse> get();
}
