import 'dart:async';
import 'dart:html';

import 'package:advance_flutter/presentation/base/baseviewmodel.dart';

class RegisterViewModel extends BaseViewModel {
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  StreamController _emailStreamController =
      StreamController<String>.broadcast();

  StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  StreamController _profilePictureStreamController =
      StreamController<File>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _isAllInputsValidStreamController.close();
    super.dispose();
  }
}
