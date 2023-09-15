import 'package:advance_flutter/presentation/register/register_viewmodel.dart';
import 'package:advance_flutter/presentation/resources/color_manager.dart';
import 'package:advance_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';
import '../common/state_renderer/state_render_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameTextEditingController =
      TextEditingController();
  TextEditingController _mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController _userEmailTextEditingController =
      TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
    _userNameTextEditingController.addListener(() {
      _viewModel.setUserName(_userNameTextEditingController.text);
    });
    _mobileNumberTextEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberTextEditingController.text);
    });
    _userEmailTextEditingController.addListener(() {
      _viewModel.setEmail(_userEmailTextEditingController.text);
    });
    _passwordTextEditingController.addListener(() {
      _viewModel.setPassword(_passwordTextEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        backgroundColor: ColorManager.white,
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.register();
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image(
                image: AssetImage(ImageAssets.splashLogo),
              ),
              SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outputErrorUserName,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameTextEditingController,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName,
                        labelText: AppStrings.userName,
                        errorText: snapshot.data,
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
                child: StreamBuilder<String?>(
                  stream: _viewModel.outputErrorPassword,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordTextEditingController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password,
                        labelText: AppStrings.password,
                        errorText: snapshot.data,
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
                  stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.register();
                              }
                            : null,
                        child: Text(AppStrings.login),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppPadding.p8,
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        //Go to login screen
                        Navigator.pushNamed(
                            context, Routes.forgotPasswordRoute);
                      },
                      child: Text(
                        AppStrings.forgotPassword,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //Go to login screen
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      child: Text(
                        AppStrings.registerText,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
