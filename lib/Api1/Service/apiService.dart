import 'package:http/http.dart' as http;

import '../Model/productModel.dart';

class HttpService{

  static Future<List<Product>> fetchProductus() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      var data = response.body;
      return productFromJson(data);
    }else{
      throw Exception();
    }

  }
}