part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  final List<NoticiaGameEntity> listNoticiaGame;
  HomeSucess({
    required this.listNoticiaGame,
  });
}

class HomeFailure extends HomeState {
  final Failure error;
  HomeFailure({
    required this.error,
  });
}
