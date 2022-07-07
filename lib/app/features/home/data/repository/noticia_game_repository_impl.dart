import 'package:dartz/dartz.dart';

import 'package:game_news/app/features/home/domain/datasource/noticia_game_datasource.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:game_news/app/features/home/domain/repository/noticia_game_repository.dart';
import 'package:game_news/app/util/error/failure.dart';

class NoticiaGameRepositoryImpl implements NoticiaGameRepository {

  final NoticiaGameDatasource datasource;
  NoticiaGameRepositoryImpl({
    required this.datasource,
  });
  
  @override
  Future<Either<Failure, List<NoticiaGameEntity>>> pegarNoticias({required String nomeEmpresa}) async {
    try {
      final result = await datasource.pegarNoticias(nomeEmpresa: nomeEmpresa);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}
