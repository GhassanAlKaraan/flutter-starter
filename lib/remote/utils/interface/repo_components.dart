import 'package:flutter_starter/remote/utils/response/api_response.dart';

abstract class CompoAbstract {
  Future<ApiResponse> getlists(dynamic model);
  Future<ApiResponse> getObjects(dynamic model);
}
