import 'package:dartz/dartz.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:game_news/app/util/error/failure.dart';

abstract class NoticiaGameRepository {
  Future<Either<Failure, List<NoticiaGameEntity>>> pegarNoticias({required String nomeEmpresa});
}