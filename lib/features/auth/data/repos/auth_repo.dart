import 'package:dartz/dartz.dart';

import '../../../../core/models/auth.dart';

abstract class AuthRepo {
  Future<Either> signin(Auth auth);
  Future<Either> signup(Auth auth);
  Future<bool> isAuthenticated();
}
