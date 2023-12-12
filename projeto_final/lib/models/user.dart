// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String nome;
  String email;
  String senha;

  User({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "email": email,
        "senha": senha,
      };
}
