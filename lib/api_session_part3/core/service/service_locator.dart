
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:statemangement/api_session_part3/core/database/remote/api_consumer.dart';
import 'package:statemangement/api_session_part3/core/database/remote/dio_consumer.dart';
import 'package:statemangement/api_session_part3/features/data/presentation/cubit/test_cubit.dart';

import '../../features/data/repository/test_repository.dart';
import '../../features/send_code_forgetten_password/presentation/cubit/send_code_cubit.dart';
import '../database/local/cache/cache_helper.dart';

final sl= GetIt.instance;
 void setup(){
   sl.registerLazySingleton(() => Dio());
   sl.registerLazySingleton(() => CacheHelper());
   sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
   sl.registerLazySingleton<TestRepository>(() => TestRepository());
   sl.registerLazySingleton<TestCubit>(() => TestCubit(sl()));
  sl.registerLazySingleton(() => SendCodeCubit(sl()));
}