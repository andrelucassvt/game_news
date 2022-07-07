import 'package:flutter/material.dart';

class CardEmpresaDeGames extends StatelessWidget {

  const CardEmpresaDeGames({ 
    required this.nomeEmpresa,
    required this.logoEmpresa,
    required this.corFundo,
    Key? key, 
  }) : super(key: key);

  final String nomeEmpresa;
  final String logoEmpresa;
  final Color corFundo;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Image.asset(
            logoEmpresa,
            fit: BoxFit.cover,
            width: 60,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              nomeEmpresa,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          const Icon(
            Icons.list,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}