import 'package:dio/dio.dart';

class DioServices{
  var url = "https://jsonplaceholder.typicode.com/posts";

  Future<dynamic> getData() async{
    Dio dio = Dio();
    return await dio.get(url,
        options: Options(responseType: ResponseType.json,
      method: 'GET')).then((response){
        return response;
    });
  }
}