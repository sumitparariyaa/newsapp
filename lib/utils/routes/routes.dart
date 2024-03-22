import 'package:flutter/material.dart';
import 'package:newsapp/utils/routes/routes_name.dart';
import 'package:newsapp/views/Details_screen.dart';
import 'package:newsapp/views/favorite_screen.dart';
import 'package:newsapp/views/home_screen.dart';
import 'package:newsapp/views/search_screen.dart';
import 'package:newsapp/views/setting_screen.dart';
import 'package:newsapp/views/splash_screen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.setting:
        return MaterialPageRoute(builder: (BuildContext context) => const SettingScreen());
      case RoutesName.search:
        return MaterialPageRoute(builder: (BuildContext context) => const SearchScreen());
      case RoutesName.detail:
        return MaterialPageRoute(builder: (BuildContext context) => const DetailScreen(title: '', description: '', time: '',));
      case RoutesName.favorite:
        return MaterialPageRoute(builder: (BuildContext context) => const FavoriteScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}