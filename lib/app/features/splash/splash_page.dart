import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_news/app/features/splash/coordinator/splash_coordinator.dart';
import 'package:game_news/app/features/splash/cubit/splash_cubit.dart';
import 'package:game_news/app/util/images/app_image.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = GetIt.I.get<SplashCubit>();
  @override
  void initState() {
    super.initState();
    controller.pegarListaDeEmpresas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<SplashCubit, SplashState>(
        bloc: controller,
        listener: (context, state) {
          if (state is SplashSucessHome) {
            SplashCoordinator.navegarParaHome(context, empresasGames: state.listaEmpresaGame);
          } else if (state is SplashSucessOrganizacao){
            SplashCoordinator.navegarParaOrganizacao(context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Loading...',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            Image.asset(AppImage.giftLoading)
          ],
        ),
      ),
    );
  }
}
