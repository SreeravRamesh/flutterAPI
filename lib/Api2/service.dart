import 'package:api/Api2/model.dart';
import 'package:http/http.dart' as http;

class RecipeService{
  static const String baseUrl = 'https://dummyjson.com/recipes';

  Future<Recipes> fetchRecipes() async{
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      return recipesFromJson(response.body);
    }else{
      throw Exception('Failed to load recipes');
    }
  }
}