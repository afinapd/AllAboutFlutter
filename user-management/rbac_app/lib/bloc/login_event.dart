abstract class LoginEvent{}

class Login extends LoginEvent{
  final username;
  final password;

  Login({this.username,this.password});
}

class GetModule extends LoginEvent{}