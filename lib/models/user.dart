class User {
  final String name;
  final String hashedPassword;
  final String email;
  final List bag;
  final List favorite;
  final bool isAdmin;

  User(
      {this.name,
      this.hashedPassword,
      this.bag,
      this.email,
      this.favorite,
      this.isAdmin});
}
