
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_cubit.dart';
import 'data_state.dart';

class SqfliteScreen extends StatelessWidget {
  const SqfliteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<DataCubit,DataState>(
      builder: (context,state) {
        return Scaffold();
      }
    );
  }
}
