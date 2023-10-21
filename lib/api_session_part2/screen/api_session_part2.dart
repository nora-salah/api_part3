import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/chef_cubit.dart';
import '../presentation/chef_state.dart';

class ApiSessionPartTwo extends StatelessWidget {
  const ApiSessionPartTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefCubit, ChefState>(
      builder: (context, state) {
        return Scaffold();
      },
    );
  }
}
