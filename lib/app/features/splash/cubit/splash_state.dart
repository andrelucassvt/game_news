part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashSucessHome extends SplashState {
  final List<EmpresaGameEntity> listaEmpresaGame;
  SplashSucessHome({
    required this.listaEmpresaGame,
  });
}

class SplashSucessOrganizacao extends SplashState {}

