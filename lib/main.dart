import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:statemangement/api_session_part1/cubit/api_cubit.dart';
import 'package:statemangement/api_session_part1/screens/api_session.dart';
import 'package:statemangement/api_session_part2/presentation/chef_cubit.dart';
import 'package:statemangement/api_session_part2/screen/api_session_part2.dart';
import 'package:statemangement/api_session_part3/core/database/local/cache/cache_helper.dart';
import 'package:statemangement/api_session_part3/core/service/service_locator.dart';
import 'package:statemangement/api_session_part3/features/data/presentation/cubit/test_cubit.dart';
import 'package:statemangement/api_session_part3/screen/test_screen.dart';

import 'api_session_part3/features/send_code_forgetten_password/presentation/cubit/send_code_cubit.dart';
import 'api_session_part3/features/send_code_forgetten_password/presentation/screen/send_code_forgetten_password_screen.dart';
import 'bloc/bloc_observer.dart';
import 'data_cubit.dart';
import 'my_provider.dart';

//statemangement+ Sqflite Ammer UpAdv
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();

await sl<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DataCubit()..createDatabase()),
        BlocProvider(create: (context) => ApiCubit()..getAlbumData()),
        BlocProvider(create: (context) => ChefCubit()..chefDelete()),
        BlocProvider(create: (context) =>sl <TestCubit>()..signIn()),
        BlocProvider(create: (context) =>sl <SendCodeCubit>()),


      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: ChangeNotifierProvider<MyProvider>(
            create: (_) => MyProvider(), child: HomePage()),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  int n = 0;

  @override
  Widget build(BuildContext context) {
    print("n=${n++}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: SendCodeForgettenPassWord(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MyProvider>(context).increament();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
