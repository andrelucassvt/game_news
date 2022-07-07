import 'package:flutter/material.dart';
import 'package:game_news/app/util/entity/empresa_game_entity.dart';
import 'package:game_news/app/util/routes/routes_app.dart';

class SplashCoordinator {

  static void navegarParaHome(BuildContext context, {required List<EmpresaGameEntity> empresasGames}) {
     Navigator.pushNamedAndRemoveUntil(
      context, 
      RoutesApp.home,
      (Route<dynamic> route) => false,
      arguments: empresasGames
    );
  }

  static void navegarParaOrganizacao(BuildContext context) {
     Navigator.pushReplacementNamed(context, RoutesApp.organizacao);
  }

  static void navegarParaSplash(BuildContext context) {
     Navigator.pushReplacementNamed(context, RoutesApp.splash);
  }
  
}