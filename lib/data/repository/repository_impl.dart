import 'package:advance_flutter/data/mapper/mapper.dart';
import 'package:advance_flutter/data/network/failure.dart';
import 'package:advance_flutter/data/request/request.dart';
import 'package:advance_flutter/domain/model.dart';
import 'package:advance_flutter/domain/repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnectedAsync) {
      final response = await remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(409, response.message ?? "Error"));
      }
    } else {
      return Left(Failure(501, "Please check your internet connection"));
    }
  }
}
