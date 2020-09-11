import 'package:gestao_app/models/user.dart';

abstract class IAuthService {
  Future<String> getToken(User user) {}
}
