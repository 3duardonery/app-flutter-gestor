import 'package:gestao_app/models/user_result.dart';

class ResultAuth {
  String token;
  UserResult data;

  ResultAuth({this.token, this.data});

  ResultAuth.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        data = UserResult.fromJson(json['data']);
}
