import 'package:flutter/material.dart';
import 'package:newsapp/views/search_screen.dart';
import 'package:newsapp/views/setting_screen.dart';
import 'package:provider/provider.dart';
import '../states/navigation_provider.dart';
import '../widgets/Bottom_navigation.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  List<Widget> pagelist = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

   @override
   Widget build(BuildContext context) {
     return Consumer<NavigationState>(
         builder: (context, navigationState, child) {
           return Scaffold(
             backgroundColor: Colors.white,
             body: pagelist[navigationState.pageIndex],
             bottomNavigationBar: const BottomNav(),
           );
         }
     );
   }
}
