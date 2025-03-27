import 'package:dio/dio.dart';

class DiooServices{
  var url = "https://dummyjson.com/users";

  Future<dynamic> getDatas() async{
    Dio dio = Dio();
    return await dio.get(url,
        options: Options(responseType: ResponseType.json,
            method: 'GET')).then((response){
      return response;
    });
  }
}