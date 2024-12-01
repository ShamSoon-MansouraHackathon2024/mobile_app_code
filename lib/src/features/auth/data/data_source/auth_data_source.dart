import 'package:dio/dio.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/Api_constants.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/Lang_methods.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/api_request.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/request_model/request_model.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/login.dart';

class AuthDataSource{
  ApiService apiService;
  AuthDataSource(this.apiService);

  Future<String> login(LoginModel model)async{
    final response = await apiService.callApi(
        request: RequestModel(
          method: Methods.POST,
          endPoint: ApiConstants.login,
          data: model.toJson()
        )
    );
    return response.data['access_token'] as String;
  }
}