import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:statemangement/api_session_part2/data/end_points.dart';

import 'chef_state.dart';

class ChefCubit extends Cubit<ChefState> {
  ChefCubit() : super(ChefInitial());

  //sign=>post
  void signIn() async {
    await Dio().post(
      EndPoints.baseUrl + EndPoints.chefSignIn,
      data: {"email": "nora88n3@gmail.com", "password": "anas123"},
    ).then((value) {
      print(value.data);
    }).catchError((e) => print(e.toString()));
  }

//chefDChangePass=>patch

  void chefChangePassword() async {
    Dio(BaseOptions(headers: {
      'token':
          "FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZmM1YTBmZjlmYmU0NTlmZDkyMjQyZiIsImVtYWlsIjoibm9yYTg4bjNAZ21haWwuY29tIiwibmFtZSI6Ik5vcmEiLCJpYXQiOjE2OTY1MzgzMjJ9.3VoCnPqfuYC-kSRn5NWhFkPiOtQB1YOU4l-iIGAptNc"
    }))
        .patch(EndPoints.baseUrl + EndPoints.chefChangePassword, data: {
          "oldPass": "anas123",
          "newPass": "anas1234",
          "confirmPassword": "anas1234"
        })
        .then((value) => print(value.data))
        .catchError((e) => print(e.toString()));
  }
//chefGet=>Get
  void getChefData() async {
    String token =
        'FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZmM1YTBmZjlmYmU0NTlmZDkyMjQyZiIsImVtYWlsIjoibm9yYTg4bjNAZ21haWwuY29tIiwibmFtZSI6Ik5vcmEiLCJpYXQiOjE2OTY1MzkyNjl9.wn7krGV_CkBLTAcqawqPvBjQksm6gw1IQRnaZ5-9-JI';
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print(decodedToken);
    var id = decodedToken['id'];
    await Dio(BaseOptions(headers: {
      'token': token,
    }))
        .get(EndPoints.baseUrl + EndPoints.getChefDataEndPoint(id))
        .then((value) => print(value))
        .catchError((e) => print(e.toString()));
  }

//chefDelete=>Delete
  void chefDelete() async {
    String token =
        'FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZmM1YTBmZjlmYmU0NTlmZDkyMjQyZiIsImVtYWlsIjoibm9yYTg4bjNAZ21haWwuY29tIiwibmFtZSI6Ik5vcmEiLCJpYXQiOjE2OTY1MzkyNjl9.wn7krGV_CkBLTAcqawqPvBjQksm6gw1IQRnaZ5-9-JI';
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print(decodedToken);
    var id = decodedToken['id'];
    await Dio(
      BaseOptions(
        headers: {
          'token': token,
        },
      ),
    )
        .delete(EndPoints.baseUrl + EndPoints.chefDelete,
        queryParameters: {'id': id})
        .then((value) => print(value.data))
        .catchError((e) {
      print(e.toString());
    });
  }


}
