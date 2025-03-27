import 'package:api/StateManagementUsingProvider/provider/movieProvider.dart';
import 'package:api/StateManagementUsingProvider/screen/wishListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(ChangeNotifierProvider<MovieProvider>(
      create: (BuildContext context)=> MovieProvider(),
  child:  MaterialApp(
    home: MovieMain(),
  ),
  ));
}

class MovieMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().moviesWishList;
    var movies = context.watch<MovieProvider>().movies;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Column(
       children: [
         ElevatedButton.icon(onPressed: ()=> Navigator.of(context).push(
             MaterialPageRoute(builder: (context)=>WishListScreen())),
             icon: const Icon(Icons.favorite_border),
             label: Text("Go to Wish List ${wishmovies.length}")),
         Expanded(
             child:ListView.builder(
               itemCount: movies.length,
                 itemBuilder: (context,index){
                 final currentMovie = movies[index];
                 return Card(
                   child: ListTile(
                   title: Text(currentMovie.title),
                   subtitle: Text(currentMovie.time!),
                   trailing: IconButton(
                       onPressed: (){
                         if(!wishmovies.contains(currentMovie))
                           {
                             context
                                  .read<MovieProvider>()
                                  .addToWishList(currentMovie);
                           }
                         else
                           {
                             context.read<MovieProvider>()
                                 .removeFromWishList(currentMovie);
                           }
                       },
                       icon: Icon(Icons.favorite,
                         color: wishmovies.contains(currentMovie)
                       ? Colors.red
                       : Colors.black26
                       ),
                   ),
                   ),
                 );
               })
         )
       ],
      ),
    );
  }
}
