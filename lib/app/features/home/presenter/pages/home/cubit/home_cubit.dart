import 'package:bloc/bloc.dart';
import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';
import 'package:game_news/app/features/home/domain/usecase/get_noticias_game_usecase.dart';
import 'package:game_news/app/util/error/failure.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  
  HomeCubit({
    required this.getNoticiasGameUsecase
  }) : super(HomeInitial());
  final GetNoticiasGameUsecase getNoticiasGameUsecase;

  Future<void> pegarNoticiasGame({required String empresaGame}) async {
    emit(HomeLoading());
    final result = await getNoticiasGameUsecase(nomeEmpresa: empresaGame);
    result.fold(
      (failure) => emit(HomeFailure(error: failure)), 
      (sucess) => emit(HomeSucess(listNoticiaGame: sucess))
    );
  }
}
