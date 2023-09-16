import 'dart:convert';

// class UserModel {
//   final int id;
//   final String Email;
//   final String FirstName;
//   final String LastName;
//   final String Avator;

//   UserModel({
//     required this.id,
//     required this.Email,
//     required this.FirstName,
//     required this.LastName,
//     required this.Avator,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       Email: json['email'],
//       FirstName: json['first_name'] ?? 'First Name',
//       LastName: json['last_name']  ?? 'Last Name',
//       Avator: json['avatar'] ?? 'https'
//     );

//   }
  //  @override
  // Map<String, dynamic> toJson() => (this); {
  //   List<Object> get props => [id, Email, FirstName,LastName,Avator];
  // }


// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    int page;
    int perPage;
    int total;
    int totalPages;
    List<UserModel> data;
    Support support;

    Welcome({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<UserModel>.from(json["data"].map((x) => UserModel.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
    };
}

class UserModel {
    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    UserModel({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    String url;
    String text;

    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
