import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:statemangement/api_session_part3/features/send_code_forgetten_password/presentation/cubit/send_code_state.dart';

import '../../data/model/send_code_repo.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  SendCodeCubit(this.repo) : super(SendCodeInitial());
  TextEditingController controller = TextEditingController();
  final SendCodeRepo repo;

  void sendCode() async {
    var result = await repo.sendCode(controller.text);
    emit(SendCodeLoading());

    result.fold((l) {
      print(l);
      emit(SendCodeError(l));

    }, (r) {
      print(r);

      emit(SendCodeSuccess(r));

    });
  }
}
