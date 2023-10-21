import 'package:dio/dio.dart';
import 'package:statemangement/api_session_part2/data/end_points.dart';
import 'package:statemangement/api_session_part3/core/database/remote/api_consumer.dart';
import 'package:statemangement/api_session_part3/core/database/remote/api_intercepters.dart';
import 'package:statemangement/api_session_part3/core/error/error_model.dart';

import '../../error/exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    //dio.options..baseUrl=EndPoints.baseUrl..headers={};
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      error: true,
      requestBody: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async{
    try {
      final res =
      await dio.delete(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (error) {
      handelError(error);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final res =
      await dio.get(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (error) {
      handelError(error);
    }
  }


@override
  Future patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final res =
      await dio.patch(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (error) {
      handelError(error);
    }
  }



@override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
          await dio.post(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (error) {
      handelError(error);
    }
  }
}

handelError(error) {
  switch (error.type) {
    case DioExceptionType.badCertificate:
    throw BadCertificateException(ErrorModel.fromJson(error.response!.data));

    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case 400:
          throw BadResponseException(ErrorModel.fromJson(error.response!.data));
        case 404:
        case 401:
        case 403:
        //  print(error.response);
          throw ServerException(ErrorModel.fromJson(error.response!.data));
        case 409:
          throw BadResponseException(ErrorModel.fromJson(error.response!.data));

      //  throw ServerException('conflict');
        case 500:
         // throw ServerException('internalServerError');
        throw ServerException(ErrorModel.fromJson(error.response!.data));

      }
      //break;
    case DioExceptionType.cancel:
      //break;
    case DioExceptionType.unknown:
    throw ServerException(ErrorModel.fromJson(error.response!.data));

  }
}

class StatusCode {
  static const int ok = 200;
  static const int badRequest = 400;

  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;
}
