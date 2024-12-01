import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/src/core/data_source/remote/api_service/extensions/future.dart';
import '../../../core/data_source/remote/api_service/service/error_handling/errors.dart';
import '../data_source/home_impl.dart';
import '../data_source/models/doctor_data.dart';

class HomeGetRepo{
  HomeDataSourceImpl homeDataSourceImpl;
  HomeGetRepo(this.homeDataSourceImpl);
  Future<Result<List<DoctorInfo>, RemoteError>> getHomeData()async{
    return await homeDataSourceImpl
        .getHomeData()
        .handleApiCalls();
  }
}