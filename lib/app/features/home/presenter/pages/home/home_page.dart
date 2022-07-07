import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_news/app/features/home/coordinator/home_coordinator.dart';
import 'package:game_news/app/features/home/presenter/pages/home/cubit/home_cubit.dart';
import 'package:game_news/app/features/home/presenter/pages/widgets/card_noticia_widget.dart';
import 'package:game_news/app/util/entity/empresa_game_entity.dart';
import 'package:game_news/app/util/strings/app_strings.dart';
import 'package:game_news/app/util/widget/loading.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  final _pageController = PageController();
  final _cubit = GetIt.I.get<HomeCubit>();

  bool mostrarbannerAd = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final args =
          ModalRoute.of(context)!.settings.arguments as List<EmpresaGameEntity>;
      _cubit.pegarNoticiasGame(empresaGame: args[0].nomeEmpresa!);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget getAd() {
    BannerAdListener bannerAdListener =
        BannerAdListener(onAdWillDismissScreen: (ad) {
      ad.dispose();
    }, onAdClosed: (ad) {
      debugPrint('Ad fechado');
    });
    BannerAd myBanner = BannerAd(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3652623512305285/8493193722'
            : 'ca-app-pub-3652623512305285/2124346056',
        size: AdSize.banner,
        request: const AdRequest(),
        listener: bannerAdListener);
    myBanner.load();

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      alignment: Alignment.center,
      child: AdWidget(ad: myBanner),
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as List<EmpresaGameEntity>;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(AppStrings.gameNews),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => HomeCoordinator.navegarParaOrganizacao(context),
            icon: const Icon(Icons.list),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
                child: LoadingBouncingGrid.square(
              backgroundColor: Colors.white,
            ));
          }

          if (state is HomeFailure) {
            return Center(
              child: ListTile(
                title: const Text('Erro ao carregar dados'),
                trailing: IconButton(
                    onPressed: (() => _cubit.pegarNoticiasGame(
                        empresaGame: args[_selectIndex].nomeEmpresa!)),
                    icon: const Icon(Icons.replay_outlined)),
              ),
            );
          }

          if (state is HomeSucess) {
            final listaNoticias = state.listNoticiaGame;
            return ListView.builder(
                itemCount: listaNoticias.length,
                itemBuilder: (context, index) {
                  if (index != 0 && index % 4 == 0) {
                    return Column(
                      children: [
                        getAd(),
                        CardNoticiaWidget(
                          noticiaGameEntity: listaNoticias[index],
                        )
                      ],
                    );
                  }
                  return CardNoticiaWidget(
                    noticiaGameEntity: listaNoticias[index],
                  );
                });
          }

          return Container();
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectIndex = index;
          _cubit.pegarNoticiasGame(empresaGame: args[index].nomeEmpresa!);
        }),
        items: args
            .map((e) => BottomNavyBarItem(
                  icon: SizedBox(
                    height: 15,
                    child: Image.asset(
                      e.logoEmpresa!,
                      color: _corDasEmpresas(nomeEmpresa: e.nomeEmpresa!),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  title: Text(e.nomeEmpresa!),
                ))
            .toList(),
      ),
    );
  }

  Color _corDasEmpresas({required String nomeEmpresa}) {
    if (nomeEmpresa == AppStrings.nintendoSwitch) {
      return Colors.red;
    }
    if (nomeEmpresa == AppStrings.playstation) {
      return Colors.blue;
    }
    return Colors.green;
  }
}
