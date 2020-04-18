abstract class LoginState{}

class Waiting extends LoginState{}

class Loading extends LoginState{}

class Success extends LoginState{
  final data;
  Success({this.data});
}

class Error extends LoginState{
  final data;
  Error({this.data});
}

