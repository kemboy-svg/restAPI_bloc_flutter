class UserModel {
  final int id;
  final String Email;
  final String FirstName;
  final String LastName;
  final String Avator;

  UserModel({
    required this.id,
    required this.Email,
    required this.FirstName,
    required this.LastName,
    required this.Avator,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      Email: json['email'],
      FirstName: json['first_name'] ?? 'First Name',
      LastName: json['last_name']  ?? 'Last Name',
      Avator: json['avatar'] ?? 'https'
    );

  }
  //  @override
  // Map<String, dynamic> toJson() => (this); {
  //   List<Object> get props => [id, Email, FirstName,LastName,Avator];
  // }


}
