class Person {
  String name;
  String id;
  String email;
  String username;

  Person();

  Person.fromJson(Map<String, dynamic> json)
      : name = json['unique_name'],
        email = json['Email'],
        id = json['UserId'],
        username = json['Username'];
}
