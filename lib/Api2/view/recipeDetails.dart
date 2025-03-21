import 'package:api/Api2/model.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
 final Recipe recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name ?? 'Recipe'),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            if(recipe.image != null)
                Image.network(
                  recipe.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            SizedBox(height: 16.0,),
            Text('Ingrediants:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
            ),
            SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(

                  recipe.ingredients?.length ?? 0,
                  (index)=> Text('-${recipe.ingredients![index]}'),
              )
            ),
            SizedBox(height: 16.0,),
            Text(
             'Instructions:'
            )
          ],
        ),
      ),
    );
  }
}
