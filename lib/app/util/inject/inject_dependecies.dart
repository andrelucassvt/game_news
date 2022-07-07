import 'package:dio/dio.dart';
import 'package:game_news/app/features/home/data/datasource/noticia_game_datasource_impl.dart';
import 'package:game_news/app/features/home/data/repository/noticia_game_repository_impl.dart';
import 'package:game_news/app/features/home/domain/datasource/noticia_game_datasource.dart';
import 'package:game_news/app/features/home/domain/repository/noticia_game_repository.dart';
import 'package:game_news/app/features/home/domain/usecase/get_noticias_game_usecase.dart';
import 'package:game_news/app/features/home/presenter/pages/home/cubit/home_cubit.dart';
import 'package:game_news/app/features/splash/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

const urlBase = 'https://newsapi.org/v2/everything?language=pt&q=';

const apiKey = '0789ed88102b47d1b0ccce2c5ca8c199';

class InjectDependecies {

  static void init(){
    final getIt = GetIt.instance;
    getIt.registerFactory<Dio>(() => Dio(BaseOptions(
      baseUrl: urlBase,
      headers: {
        'X-Api-Key': apiKey
      }
    )));

    //Datasource
    getIt.registerFactory<NoticiaGameDatasource>(() => NoticiaGameDatasourceImpl(dio: getIt()));

    //repository
    getIt.registerFactory<NoticiaGameRepository>(() => NoticiaGameRepositoryImpl(datasource: getIt()));

    //usecase
    getIt.registerFactory<GetNoticiasGameUsecase>(() => GetNoticiasGameUsecase(noticiaGameRepository: getIt()));

    //Cubit
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getNoticiasGameUsecase: getIt()));
    getIt.registerFactory<SplashCubit>(() => SplashCubit());
  }
}