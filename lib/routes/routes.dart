import 'package:flutter/material.dart';
import 'package:sqlflite_todo_app/constants/strings/routes_name.dart';
import 'package:sqlflite_todo_app/screens/home.dart';

class Myroutes {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePageNmae:
        return MaterialPageRoute(
          builder: (context) {
            return  MyHomePage();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold();
          },
        );
    }
  }
}
