import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';

abstract class NoticiaGameDatasource {
  Future<List<NoticiaGameEntity>> pegarNoticias({required String nomeEmpresa});
}