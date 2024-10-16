import 'package:flutter_starter/remote/utils/dio/dio_client.dart';
import 'package:flutter_starter/remote/utils/exception/api_error_handler.dart';
import 'package:flutter_starter/remote/utils/interface/repo_inteface.dart';
import 'package:flutter_starter/remote/utils/response/api_response.dart';

import 'package:dio/dio.dart';

class ExampleRepo extends RepoAbstract {
  final DioClient dioClient;
  Response? response;
  ExampleRepo({required this.dioClient});
  @override
  Future<ApiResponse> get() async {
    try {
      response = await dioClient.get("https://fakestoreapi.com/products");
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
