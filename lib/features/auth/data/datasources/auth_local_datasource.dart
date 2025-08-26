import 'package:dartz/dartz.dart';

import '../../../../core/datasources/local_datasource.dart';
import '../../../../core/models/user.dart';

abstract class AuthLocalDataSource extends LocalDataSource {
  Future<Either> signIn(User user);
  Future<Either> signUp(User user);
}
