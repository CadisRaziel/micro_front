import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/microapp.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

//*Para adicionar as rotas em todos os micro apps
  void registerRouters() {
    if (baseRoutes.isNotEmpty) {
      routes.addAll(baseRoutes);
    } else if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }


  //*Vai no 'onGenerateRoute' no base_app main.dart
  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routeName = settings.name;
    var routeArgs = settings.arguments;

    var navigateTO = routes[routeName];
    if (navigateTO == null) {
      return null;
    }

    return MaterialPageRoute(
      builder: (context) => navigateTO.call(context, routeArgs ?? ''),
    );
  }
}
