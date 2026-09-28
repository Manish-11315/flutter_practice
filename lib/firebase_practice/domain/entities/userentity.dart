class Userentity {
  final String email;
  final String username;
  final String password;
  final bool is_banned;

  Userentity({
    required this.email,
    required this.password,
    required this.username,
    required this.is_banned,
  });
}
