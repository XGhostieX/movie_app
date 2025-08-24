import 'package:dartz/dartz.dart';

import '../../../../core/models/user.dart';

abstract class AuthRepo {
  Future<Either> signIn(User user);
  Future<Either> signUp(User user);
}
