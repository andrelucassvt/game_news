import 'package:game_news/app/features/home/presenter/pages/home/home_page.dart';
import 'package:game_news/app/features/organizacao/presenter/pages/organizacao/organizacao_page.dart';
import 'package:game_news/app/features/splash/splash_page.dart';

class RoutesApp {
  static const String splash = '/';
  static const String organizacao = '/organizacao';
  static const String home = '/home';

  static routesNamed() {
    return {
      splash: (context) => const SplashPage(),
      organizacao: (context) => const OrganizacaoPage(),
      home: (context) => const HomePage(),
    };
  }
}