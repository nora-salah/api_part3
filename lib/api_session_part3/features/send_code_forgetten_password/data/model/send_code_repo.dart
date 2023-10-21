import 'package:dartz/dartz.dart';
import 'package:statemangement/api_session_part3/core/database/remote/api_consumer.dart';
import 'package:statemangement/api_session_part3/core/database/remote/end_point.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/service/service_locator.dart';

class SendCodeRepo{
  Future<Either<String,String>> sendCode(String email) async{
    try{
      var res=await sl<ApiConsumer>().post(EndPoint.sendCode,data: {
        "email":email
      });
      return Right(res['message']);
    }on ServerException catch (e) {
      //print(e.errorModel.errorMessage);
      return Left(e.errorModel.errorMessage);
    }


  }
}