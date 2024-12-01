import 'dart:io';

import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/extensions/future.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/service/error_handling/errors.dart';
import 'package:shamsoon/src/features/sending_pic_to_ai/data/data_source/details_data_source.dart';

class PanelDetailsRepo{
  DetailsDataSource dataSource;

  PanelDetailsRepo(this.dataSource);

  Future<Result<Response, RemoteError>> sendImageToAi(File? imageFile)async{
    return await dataSource
        .sendToAiServer(imageFile)
        .handleApiCalls();
  }
}