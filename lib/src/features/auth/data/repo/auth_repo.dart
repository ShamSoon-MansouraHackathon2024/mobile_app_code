import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/extensions/future.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/error_handling/errors.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/login.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/resgistes_model.dart';

import '../data_source/auth_data_source.dart';

class AuthRepo {
  AuthDataSource dataSource;

  AuthRepo(this.dataSource);

  Future<Result<String, RemoteError>> login(LoginModel model) async {
    return dataSource.login(model).handleApiCalls();
  }

  Future<Result<String, RemoteError>> signUp(RegisterModel model) async {
    return dataSource.signUp(model).handleApiCalls();
  }
}