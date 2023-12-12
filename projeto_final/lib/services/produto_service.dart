import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoService {
  Future novoProduto(Produto produto) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    String url = 'http://204.48.20.110/anuncios/';
    print(token);
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: token.toString()
        },
        body: json.encode(produto.toJson()));
    if (response.statusCode == 201) {
      print('certo');
      return true;
    } else {
      Exception('Falha de conexão com o server.');
    }
    return null;
  }

  Future<List<Produto>> getProdutos() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    const url = 'http://204.48.20.110/anuncios/';
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: token.toString(),
    });
    List<Produto> produtos = List<Produto>.empty(growable: true);
    if (response.statusCode == 200) {
      List responseList = jsonDecode(response.body);
      for (var element in responseList) {
        produtos.add(Produto.fromJson(element));
      }
    }
    return produtos;
  }

  Future deleteProduto(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    String url = 'http://204.48.20.110/anuncios/$id';
    final response = await http.delete(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: token.toString(),
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
