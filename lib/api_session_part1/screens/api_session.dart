import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemangement/api_session_part1/cubit/api_cubit.dart';
import 'package:statemangement/api_session_part1/cubit/api_cubit.dart';

import '../cubit/api_state.dart';

class ApiSession extends StatelessWidget {
  const ApiSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiCubit, ApiState>(
      builder: (context, state) {
        return Scaffold(
        body:state is GetAlbumLoadingState? Center(child: CircularProgressIndicator(),):  ListView.builder(itemBuilder: (context,index){
          return ListTile(
            title: Text(BlocProvider.of<ApiCubit>(context).albums[index].title),
          );
        }),
        );
      },
    );
  }
}
