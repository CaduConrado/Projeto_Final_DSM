import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UserHelper {
  getUser() async {
    String url = 'http://204.48.20.110/usuario/';
    final prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: prefs.getString("token").toString()
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      final int id = mapResponse["id"];
      prefs.setInt("id", id);
      return id;
    }
    return null;
  }
}
