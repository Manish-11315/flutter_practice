abstract class fireEvents {}

class loginUserEvent extends fireEvents{
  final String email;
  final String password;
  loginUserEvent({required this.email, required this.password});
}

class registerUserEvent extends fireEvents{
  final String email;
  final String password;
  registerUserEvent({required this.email, required this.password});
}

class updateUserPasswordEvent extends fireEvents{
  final String email;
  final String currentPassword;
  final String newPassword;
  updateUserPasswordEvent({required this.email, required this.currentPassword, required this.newPassword});
}

class updateUsernameEvent extends fireEvents{
  final String newUsername;
  updateUsernameEvent({required this.newUsername});
}

class logoutUserEvent extends fireEvents{}

class deleteUserEvent extends fireEvents{
  final String email;
  final String password;
  deleteUserEvent({required this.email, required this.password});
}