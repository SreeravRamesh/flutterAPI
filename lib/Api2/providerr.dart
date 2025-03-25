import 'package:api/Api2/model.dart';
import 'package:api/Api2/service.dart';
import 'package:flutter/cupertino.dart';

class RecipeProvider extends ChangeNotifier{
  List<Recipe> _recipes=[];
  List<Recipe> filteredRecipes=[];

  List<Recipe> get recipesnew => filteredRecipes.isNotEmpty ? filteredRecipes : _recipes;

  Future<void> fetchRecipes() async{
    try{
      Recipes recipe = await RecipeService().fetchRecipes();
      _recipes = recipe.recipes ??[];
      filteredRecipes = _recipes;
      notifyListeners();

    }catch(e){
      throw Exception('Failed to load recipes: $e');
    }
  }

  void searchRecipes(String query){
    filteredRecipes=_recipes.where((recipe){
      return recipe.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

}