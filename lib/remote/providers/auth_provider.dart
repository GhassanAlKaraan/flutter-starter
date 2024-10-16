import 'package:flutter_starter/remote/models/user_model.dart';
import 'package:flutter_starter/remote/repositories/auth_repository.dart';
import 'package:flutter_starter/remote/utils/response/api_response.dart';
import 'package:flutter_starter/remote/utils/response/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool? _isLoading = false;
  bool? _isLoadingPassword;

  bool? get isLoading => _isLoading;
  bool? get isLoadingPassword => _isLoadingPassword;

  String? _loginErrorMessage;
  String? get loginErrorMessage => _loginErrorMessage;

  String? _deletedMessage;
  String? get deletedMessage => _deletedMessage;

  ResponseModel? responseModel; // for the fontend
  ApiResponse? apiResponse; // handle the backend response

  Future<ResponseModel?> login(UserModel c) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    apiResponse = await authRepo.login(c);
    if (apiResponse!.response != null &&
        apiResponse!.response!.statusCode == 200) {
      Map map = apiResponse!.response!.data;
      String token = map["token"];
      authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, 'Success');
    } else {
      _isLoading = false;

      String errorMessage;
      if (apiResponse!.error is String) {
        errorMessage = apiResponse!.error.toString();
      } else {
        errorMessage = apiResponse!.error.errors[0].message;
      }
      _loginErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  bool isLoggedIn() {
    return authRepo.isLogin();
  }

  bool logout() {
    if (authRepo.logout()) {
      return false;
    } else {
      return authRepo.logout();
    }
  }
}
