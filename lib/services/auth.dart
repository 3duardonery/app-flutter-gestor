import 'dart:convert';

import 'package:gestao_app/models/result_auth.dart';
import 'package:gestao_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String _url = "https://94c9c0ddfa5f4ef28a75.azurewebsites.net/api";

  Future<ResultAuth> getToken(User user) async {
    final response = await http.post(_url + "/auth",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      return ResultAuth.fromJson(jsonDecode(response.body.toString()));
    } else {
      return ResultAuth(token: null, data: null);
    }
  }
}
