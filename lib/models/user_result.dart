class UserResult {
  String userId;
  String email;
  String username;
  String name;

  UserResult.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        email = json['email'],
        username = json['username'],
        name = json['name'];
}
