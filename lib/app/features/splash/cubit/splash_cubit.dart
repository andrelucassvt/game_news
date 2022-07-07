import 'package:bloc/bloc.dart';
import 'package:game_news/app/util/entity/empresa_game_entity.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());


  Future<void> pegarListaDeEmpresas() async {
    emit(SplashLoading());
    final prefs = await SharedPreferences.getInstance();
    var dados = prefs.getStringList('listaEmpresas');
    if (dados != null && dados.isNotEmpty) {
      final listaEmpresas = EmpresaGameEntity.fromJsonList(dados);
      emit(SplashSucessHome(listaEmpresaGame: listaEmpresas));
    } else {
      emit(SplashSucessOrganizacao());
    }
  }
}
