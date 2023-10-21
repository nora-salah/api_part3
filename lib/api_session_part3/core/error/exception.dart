import 'package:statemangement/api_session_part3/core/error/error_model.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}
class BadCertificateException extends ServerException{
  BadCertificateException(super.errorModel);

}

class BadResponseException extends ServerException{
  BadResponseException(super.errorModel);

}