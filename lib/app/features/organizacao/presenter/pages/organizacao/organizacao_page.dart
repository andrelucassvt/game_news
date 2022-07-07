import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_news/app/features/organizacao/presenter/widgets/card_empresa_de_game.dart';
import 'package:game_news/app/features/splash/coordinator/splash_coordinator.dart';
import 'package:game_news/app/util/images/empresas_image.dart';
import 'package:game_news/app/util/images/personagens_image.dart';
import 'package:game_news/app/util/entity/empresa_game_entity.dart';
import 'package:game_news/app/util/strings/app_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizacaoPage extends StatefulWidget {
  const OrganizacaoPage({ Key? key }) : super(key: key);

  @override
  State<OrganizacaoPage> createState() => _OrganizacaoPageState();
}

class _OrganizacaoPageState extends State<OrganizacaoPage> {

  final List<EmpresaGameEntity> _listaEmpresas = [
    EmpresaGameEntity(
      logoEmpresa: EmpresasImage.nintendo,
      nomeEmpresa: AppStrings.nintendoSwitch,
      corFundo: Colors.red,
      personagem: PersonagensImage.mario,
    ),
    EmpresaGameEntity(
      logoEmpresa: EmpresasImage.xbox,
      nomeEmpresa: AppStrings.xbox,
      corFundo: Colors.green,
      personagem: PersonagensImage.master,
    ),
    EmpresaGameEntity(
      logoEmpresa: EmpresasImage.playstation,
      nomeEmpresa: AppStrings.playstation,
      corFundo: Colors.blue,
      personagem: PersonagensImage.kratos,
    ), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.gameNews),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Salvar alterações'),
        onPressed: () => _salvarDados(),
      ),
      body: Stack(
        children: [
          Builder(
            builder: (_) {
              return SizedBox(
                height: double.infinity,
                child: Image.asset(
                  _listaEmpresas[0].personagem!, 
                  fit: BoxFit.cover,
                ),
              );
            }
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 10,
              right: 10,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                'Escolha a ordem de prioridade dos consoles',
                textAlign: TextAlign.center,
                style: GoogleFonts.secularOne(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Theme(
              data: ThemeData(
                canvasColor: Colors.transparent,
              ),
              child: ReorderableListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(15),
                children: <Widget>[
                  for (int index = 0; index < _listaEmpresas.length; index += 1)
                    CardEmpresaDeGames(
                      nomeEmpresa: _listaEmpresas[index].nomeEmpresa!, 
                      logoEmpresa: _listaEmpresas[index].logoEmpresa!, 
                      corFundo: _listaEmpresas[index].corFundo!,
                      key: Key(_listaEmpresas[index].nomeEmpresa!),
                    ),
                ],
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final EmpresaGameEntity item = _listaEmpresas.removeAt(oldIndex);
                    _listaEmpresas.insert(newIndex, item);
                  });
                },
              ),
            ),
          ),
        ],
      )
    );
  }

  _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('listaEmpresas', [
      for (EmpresaGameEntity empresa in _listaEmpresas)
        jsonEncode(empresa.toJson()),]);
    SplashCoordinator.navegarParaHome(context, empresasGames: _listaEmpresas);
  }
}