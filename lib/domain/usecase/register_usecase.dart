import 'package:advance_flutter/data/network/failure.dart';
import 'package:advance_flutter/domain/model/model.dart';
import 'package:advance_flutter/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/request/request.dart';
import '../repository/repository.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
      input.countryMobileCode,
      input.userName,
      input.email,
      input.password,
      input.mobileNumber,
      input.profilePicture,
    ));
  }
}

class RegisterUseCaseInput {
  String countryMobileCode;
  String userName;
  String email;
  String password;
  String mobileNumber;
  String profilePicture;

  RegisterUseCaseInput(this.countryMobileCode, this.userName, this.email,
      this.password, this.mobileNumber, this.profilePicture);
}
