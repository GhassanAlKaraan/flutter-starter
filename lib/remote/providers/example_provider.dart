import 'package:flutter_starter/remote/repositories/example_repository.dart';
import 'package:flutter_starter/remote/utils/response/api_response.dart';
import 'package:flutter_starter/remote/utils/response/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ExampleProvider extends ChangeNotifier {
  ResponseModel? responseModel;
  ApiResponse? apiResponse;
  ExampleRepo? exampleRepo;
  ExampleProvider({this.exampleRepo});

  Future<ResponseModel?> getItems() async {
    apiResponse = await exampleRepo!.get();
    if (apiResponse!.response != null &&
            apiResponse!.response!.statusCode == 200 ||
        apiResponse!.response!.statusCode == 304) {
      responseModel = ResponseModel(true, 'Success');
    } else {
      responseModel =
          ResponseModel(false, apiResponse!.response!.data['message']);
    }
    notifyListeners();
    return responseModel;
  }
}
