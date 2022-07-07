import 'package:dio/dio.dart';
import 'package:game_news/app/features/home/data/model/noticia_game_model.dart';
import 'package:game_news/app/features/home/domain/datasource/noticia_game_datasource.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:game_news/app/util/error/common_error.dart';

class NoticiaGameDatasourceImpl implements NoticiaGameDatasource {
  final Dio dio;
  NoticiaGameDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List<NoticiaGameEntity>> pegarNoticias(
      {required String nomeEmpresa}) async {
    try {
      final dataAtual = DateTime.now();
      final dataHoje = '&${dataAtual.year}-${dataAtual.day}&sortBy=popularity';
      final result = await dio.get(nomeEmpresa + dataHoje);
      return NoticiaGameModel.jsonToList(result.data['articles']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw ErrorConnection(messageError: 'Sem conexão com a internet');
      }
      throw ErrorGeneric(messageError: 'Não conseguimos buscar os dados');
    }
  }
}
