import 'package:flutter/material.dart';
import 'package:newsapp/states/theme_provider.dart';
import 'package:newsapp/utils/routes/routes.dart';
import 'package:newsapp/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
     initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}