import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/states/bookmarkProvider.dart';
import 'package:newsapp/states/carousel_provider.dart';
import 'package:newsapp/states/navigation_provider.dart';
import 'package:newsapp/states/theme_provider.dart';
import 'package:provider/provider.dart';
import 'mynews.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ChangeNotifierProvider(create: (context) => NavigationState()),
            ChangeNotifierProvider(create: (context) => CarouselProvider()),
            ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ],
      child: const NewsApp()
      )
  );
}




