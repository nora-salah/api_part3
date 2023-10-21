import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:statemangement/api_session_part3/features/send_code_forgetten_password/presentation/cubit/send_code_cubit.dart';

import '../cubit/send_code_state.dart';

class SendCodeForgettenPassWord extends StatelessWidget {
  const SendCodeForgettenPassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendCodeCubit, SendCodeState>(
      listener: (context,state){
        if(state is SendCodeSuccess){
          Fluttertoast.showToast(
              msg: state.massage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
        if(state is SendCodeError){
          Fluttertoast.showToast(
              msg: state.massage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: BlocProvider.of<SendCodeCubit>(context).controller,
                ),
                state is SendCodeLoading? Center(child: CircularProgressIndicator(),):
                MaterialButton(child: Text('Send Code'),onPressed: (){
                 BlocProvider.of<SendCodeCubit>(context).sendCode();
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
