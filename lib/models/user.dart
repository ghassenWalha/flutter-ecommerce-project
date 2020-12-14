class User {
  final String name;
  final String password;
  final String email;
  final List bag;
  final List favorite;
  final bool isAdmin;

  User(
      {this.name,
      this.password,
      this.bag,
      this.email,
      this.favorite,
      this.isAdmin});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        name: json["name"],
        password: json["password"],
        bag: json["bag"],
        email: json["email"],
        favorite: json['favorite'],
        isAdmin: json['isAdmin']);
  }

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "password": password,
        "bag": bag,
        "email": email,
        "favorite": favorite,
        "isAdmin": isAdmin
      };
}
