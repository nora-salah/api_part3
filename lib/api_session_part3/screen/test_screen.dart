import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemangement/api_session_part3/features/data/presentation/cubit/test_cubit.dart';
import 'package:statemangement/api_session_part3/features/data/presentation/cubit/test_state.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        return Scaffold();
      },
    );
  }
}
