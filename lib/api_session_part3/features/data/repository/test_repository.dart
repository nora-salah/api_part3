import 'package:dartz/dartz.dart';
import 'package:statemangement/api_session_part2/data/model/login_model.dart';
import 'package:statemangement/api_session_part3/core/database/remote/api_consumer.dart';
import 'package:statemangement/api_session_part3/core/database/remote/end_point.dart';
import 'package:statemangement/api_session_part3/core/error/exception.dart';

import '../../../core/service/service_locator.dart';

class TestRepository {
  Future<Either<String,LoginModel>> signIn()async {
    try {
      final res = await sl<ApiConsumer>().post(EndPoint.chefSignIn,
          data: {"email": "nora88n3@gmail.com", "password": "anas1234"});
      //print(model.massage);
      return Right(LoginModel.fromJson(res));
    } on ServerException catch (e) {
      //print(e.errorModel.errorMessage);
      return Left(e.errorModel.errorMessage);
    }
  }
}
