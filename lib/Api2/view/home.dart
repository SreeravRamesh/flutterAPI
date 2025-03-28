import 'package:api/Api2/providerr.dart';
import 'package:api/Api2/view/recipeGrid.dart';
import 'package:api/Api2/view/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        actions: [
          IconButton(onPressed: () async{
            final String? query = await showSearch(
                context: context,
                delegate: RecipeSearchDelegate(),
            );
            if(query != null && query.isNotEmpty)
              {
                recipeProvider.searchRecipes(query);
              }
          },
              icon: Icon(Icons.search))
        ],
      ),
      body: recipeProvider.recipesnew.isEmpty
        ? Center(child: CircularProgressIndicator(),)
        : LayoutBuilder(
          builder: (context,constraints){
            if(constraints.maxWidth>=600)
              {
                return RecipeGridView(recipeProvider.recipesnew, 4, constraints.maxWidth);
              }
           else if(constraints.maxWidth>=400)
            {
              return RecipeGridView(recipeProvider.recipesnew, 2, constraints.maxWidth);
            }
           else
             {
               return RecipeGridView(recipeProvider.recipesnew, 1, constraints.maxWidth);
             }
          }),
    );
  }
}
