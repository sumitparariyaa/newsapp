import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier{
  List<String> _articles = [];
  List<String> get articles => _articles;

  void toggleFavorite(String articles){
    final isExist = _articles.contains(articles);
    if(isExist){
      _articles.remove(articles);
    }else{
      _articles.add(articles);
    }
    notifyListeners();
  }

  bool isExist(String articles){
    final isExist = _articles.contains(articles);
    return isExist;
  }
  void clearFavorite(){
    _articles = [];
    notifyListeners();
  }
}