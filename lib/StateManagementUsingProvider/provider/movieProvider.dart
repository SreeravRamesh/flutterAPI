import 'dart:math';
import 'package:api/StateManagementUsingProvider/model/movie.dart';
import 'package:flutter/foundation.dart';

final List<Movies> movieList = List.generate(
  100,
    (index) => Movies(
      title: 'Movie $index',
      time: '${Random().nextInt(100)+60}minutes'));

class MovieProvider extends ChangeNotifier{

  final List<Movies> _movie = movieList;

  List<Movies> get movies => _movie;

  final List<Movies> _wishListMovie = [];

  List<Movies> get moviesWishList => _wishListMovie;

  void addToWishList(Movies movieFromMainPage){
    _wishListMovie.add(movieFromMainPage);
    notifyListeners();
  }

  void removeFromWishList(Movies removeMovie){
    _wishListMovie.remove(removeMovie);
    notifyListeners();
  }
}