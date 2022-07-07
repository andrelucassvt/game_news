import 'dart:convert';

import 'package:flutter/material.dart';

class EmpresaGameEntity {
  final String? logoEmpresa;
  final String? nomeEmpresa;
  final Color? corFundo;
  final String? personagem;

  EmpresaGameEntity({
    this.logoEmpresa,
    this.nomeEmpresa,
    this.corFundo,
    this.personagem,
  });

  factory EmpresaGameEntity.fromJson(Map<String, dynamic> json) {
    return EmpresaGameEntity(
      logoEmpresa: json['logoEmpresa'],
      nomeEmpresa: json['nomeEmpresa'],
      corFundo: json['corFundo'],
      personagem: json['personagem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logoEmpresa': logoEmpresa,
      'nomeEmpresa': nomeEmpresa,
      'personagem': personagem,
    };
  }

   static fromJsonList(List lista){
    return lista.map((e) => EmpresaGameEntity.fromJson(json.decode(e))).toList();
  }
}
