import 'package:gestao_app/models/result_auth.dart';

class ResponseAuth {
  bool sucess;
  String message;
  ResultAuth data;

  ResponseAuth({this.sucess, this.data, this.message});

  ResponseAuth.fromJson(Map<String, dynamic> json)
      : sucess = json['success'],
        message = json['message'],
        data = ResultAuth.fromJson(json['data']);
}
