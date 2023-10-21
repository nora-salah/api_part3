import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../model/album_model.dart';
import 'api_state.dart';


class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());
  List<AlbumModel> albums = [];
  void getAlbumData()async{
    emit(GetAlbumLoadingState());
    var data=[];

    // final response=
   await Dio().get('https://jsonplaceholder.typicode.com/albums')
       .then((value) {
         print(value.statusCode);
         data=value.data;
         albums= data.map((e) => AlbumModel.fromJson(e)).toList();
          print(albums[0].title);
         emit(GetAlbumSucessState());

   }).catchError((e){
       print(e.toString());
       emit(GetAlbumErrorState());

     });
     //data = value.data;
     // print(response.data);
  // List<Map<String, dynamic>>
   // var data = response.data;
 //  print(data[2]['id']);
  // var statusCode = response.statusCode;
    //  print(statusCode);
}}
