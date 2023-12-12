import 'dart:convert';

import 'package:projeto_final/helpers/user_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<User?> newUser(User user) async {
    String url = 'http://204.48.20.110/usuario/';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      print('Deu bom');
    } else {
      Exception('Falha de conexão com o server.');
    }
    return null;
  }

  Future loginUser(String email, String senha) async {
    const url = 'http://204.48.20.110/login';
    final response = await http.post(
      Uri.parse(url),
      body: {'email': email, 'senha': senha},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", mapResponse["token"]);
      return true;
    } else {
      return false;
    }
  }

  getUserId() {
    final UserHelper userHelper = UserHelper();
    final id = userHelper.getUser();
    return id;
  }
}
