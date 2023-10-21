
abstract class SendCodeState {}

class SendCodeInitial extends SendCodeState {}
class SendCodeSuccess extends SendCodeState {
  final String massage;

  SendCodeSuccess(this.massage);
}
class SendCodeLoading extends SendCodeState {}
class SendCodeError extends SendCodeState {
  final String massage;

  SendCodeError(this.massage);

}
//class SendCodeInitial extends SendCodeState {}

