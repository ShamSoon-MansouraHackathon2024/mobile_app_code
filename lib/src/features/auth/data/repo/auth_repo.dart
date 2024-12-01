import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/extensions/future.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/Api_constants.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/Lang_methods.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/api_request.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/error_handling/errors.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/request_model/request_model.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/login.dart';

import '../data_source/auth_data_source.dart';

class AuthRepo{
  AuthDataSource dataSource;
  AuthRepo(this.dataSource);

  Future<Result<String, RemoteError>> login(LoginModel model)async{
    return dataSource.login(model).handleApiCalls();
  }
}