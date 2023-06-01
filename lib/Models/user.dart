class User {
  String name, email, phoneNumber, password;
  User({
    required this.email,
    required this.name,
    required this.password,
    required this.phoneNumber,
  });
  @override
  String toString() {
    return "$email   $name     $phoneNumber      $password";
  }
}
