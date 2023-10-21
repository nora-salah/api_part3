import 'package:bloc/bloc.dart';
import 'package:statemangement/api_session_part3/core/database/remote/api_consumer.dart';
import 'package:statemangement/api_session_part3/core/database/remote/end_point.dart';

import '../../../../core/service/service_locator.dart';
import '../../repository/test_repository.dart';
import 'test_state.dart';


class TestCubit extends Cubit<TestState> {
  TestCubit(this.testRepository) : super(TestInitial());
  final TestRepository testRepository;

  void signIn()async{
    var res=await testRepository.signIn();
    res.fold((l) => print('=>>>$l'), (r) =>  print('=>>>${r.massage}'));
  }
}
/*  void getDataOfChef()async{
   final res= await sl<ApiConsumer>().post(EndPoint.chefSignIn,
   data:
   {
     "email": "nora88n3@gmail.com",
     "password": "anas123"
   });
   print(res);
  }
*/