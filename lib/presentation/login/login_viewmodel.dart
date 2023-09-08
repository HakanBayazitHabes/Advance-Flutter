import '../base/baseviewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => throw UnimplementedError();

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => throw UnimplementedError();

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  // outputs
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();
}

abstract mixin class LoginViewModelInputs {
  // three functions
  setUserName(String userName);

  setPassword(String password);

  login();

  //two sinks
  Sink get inputUserName;

  Sink get inputPassword;
}

abstract mixin class LoginViewModelOutputs {
  // two streams
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;
}
