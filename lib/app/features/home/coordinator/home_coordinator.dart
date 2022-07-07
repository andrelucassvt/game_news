import 'package:flutter/material.dart';
import 'package:game_news/app/util/routes/routes_app.dart';

class HomeCoordinator {

  static void navegarParaOrganizacao(BuildContext context) {
    Navigator.pushNamed(context, RoutesApp.organizacao);
  }
  
}