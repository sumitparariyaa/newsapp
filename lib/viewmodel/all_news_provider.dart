import 'package:newsapp/repository/all_news_repository.dart';
import '../models/all_news_model.dart';

class NewsViewModel{
  final _allNews = AllNewsRepository();

  Future<AllNewsModel>  allNewsPost() async{
    final response = _allNews.allNewsPost();
    return response;
  }
}