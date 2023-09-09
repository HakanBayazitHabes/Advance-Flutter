import 'package:advance_flutter/presentation/login/login_viewmodel.dart';
import 'package:advance_flutter/presentation/resources/strings_manager.dart';
import 'package:advance_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _loginViewModel = LoginViewModel(null); // todo pass here

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _loginViewModel.start();
    _userNameController.addListener(() {
      _loginViewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _loginViewModel.setPassword(_passwordController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget _getContentWidget() {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: AppPadding.p100),
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset(ImageAssets.loginIc),
              SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _loginViewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName,
                        labelText: AppStrings.userName,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.userNameError,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _loginViewModel.outputIsPasswordValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password,
                        labelText: AppStrings.password,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordError,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _loginViewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _loginViewModel.login();
                            }
                          : null,
                      child: Text(AppStrings.login),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }
}
