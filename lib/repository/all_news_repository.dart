import 'package:newsapp/data/network/base_api_services.dart';
import 'package:newsapp/resources/app_url.dart';
import '../data/network/netwok_api_services.dart';
import '../models/all_news_model.dart';

class AllNewsRepository{
   BaseApiServices _apiServices = NetworkApiService();

   Future<AllNewsModel> allNewsPost() async{
     try{
       dynamic response = await _apiServices.getGetApiResponse(AppUrl.baseurl);
       return response = AllNewsModel.fromJson(response) ;
     }catch(e){
       throw e;
     }
   }
}
