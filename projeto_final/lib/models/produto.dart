// To parse this JSON data, do
//
//     final produto = produtoFromJson(jsonString);

import 'dart:convert';

Produto produtoFromJson(String str) => Produto.fromJson(json.decode(str));

String produtoToJson(Produto data) => json.encode(data.toJson());

class Produto {
  late int? id;
  String titulo;
  String descricao;
  int preco;
  int usuarioId;

  Produto({
    this.id,
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.usuarioId,
  });

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        id: json["id"],
        titulo: json["titulo"],
        descricao: json["descricao"],
        preco: json["preco"],
        usuarioId: json["usuarioId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descricao": descricao,
        "preco": preco,
        "usuarioId": usuarioId,
      };

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
