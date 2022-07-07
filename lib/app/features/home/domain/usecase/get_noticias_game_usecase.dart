import 'package:dartz/dartz.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:game_news/app/features/home/domain/repository/noticia_game_repository.dart';
import 'package:game_news/app/util/error/failure.dart';

class GetNoticiasGameUsecase {

  final NoticiaGameRepository noticiaGameRepository;
  GetNoticiasGameUsecase({
    required this.noticiaGameRepository,
  });

  Future<Either<Failure, List<NoticiaGameEntity>>> call({required String nomeEmpresa}) async {
    return await noticiaGameRepository.pegarNoticias(nomeEmpresa: nomeEmpresa);
  }
}
