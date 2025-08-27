import 'package:dartz/dartz.dart';

import '../../../../core/models/user.dart';
import '../datasources/auth_local_datasource.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthLocalDataSource authLocalDataSource;

  AuthRepoImpl(this.authLocalDataSource);
  @override
  Future<Either> signIn(User user) async {
    return authLocalDataSource.signIn(user);
  }

  @override
  Future<Either> signUp(User user) async {
    return authLocalDataSource.signUp(user);
  }
}
