
class UserModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final  String avator;

  UserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.avator,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        first_name:  json['first_name'],
        last_name: json ['last_name'],
        email: json['email'],
        avator: json['avatar'],
    );
  }
}
