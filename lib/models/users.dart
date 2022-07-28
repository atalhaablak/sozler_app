// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String ad;
  final String email;
  final String password;

  User({
    required this.email,
    required this.password,
    required this.ad,
  });

  List<User> usersList = [];

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
