import 'package:flutter/material.dart';
import 'package:game_news/app/util/routes/routes_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: false
        )
      ),
      routes: RoutesApp.routesNamed(),
    );
  }
}