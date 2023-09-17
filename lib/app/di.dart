import 'package:advance_flutter/app/app_prefs.dart';
import 'package:advance_flutter/data/data_source/remote_data_source.dart';
import 'package:advance_flutter/data/network/app_api.dart';
import 'package:advance_flutter/data/network/dio_factory.dart';
import 'package:advance_flutter/data/repository/repository_impl.dart';
import 'package:advance_flutter/domain/repository/repository.dart';
import 'package:advance_flutter/domain/usecase/home_usecase.dart';
import 'package:advance_flutter/domain/usecase/login_usecase.dart';
import 'package:advance_flutter/domain/usecase/register_usecase.dart';
import 'package:advance_flutter/presentation/login/login_viewmodel.dart';
import 'package:advance_flutter/presentation/main/home/home_viewmodel.dart';
import 'package:advance_flutter/presentation/register/register_viewmodel.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/network_info.dart';
import '../domain/usecase/forgot_password_usecase.dart';
import '../presentation/forgot_password/forgot_passwordviewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharePrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharePrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(DataConnectionChecker()));

  // dio instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  // DioFactory dioFactory = DioFactory(_appPreferences);
  // dioFactory.getDio()
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance
        .registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(
        () => HomeViewModel(instance()));
  }
}
