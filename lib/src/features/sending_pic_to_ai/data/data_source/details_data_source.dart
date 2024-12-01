import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/Lang_methods.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/api_request.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/request_model/request_model.dart';

class DetailsDataSource{
  ApiService service;
  DetailsDataSource(this.service);
  
  Future<Response> sendToAiServer(File? image)async{
    final result = await service.callApi(
        request: RequestModel(
            method: Methods.POST,
            endPoint: 'predict'
        )
    );

    return result;
  }
}