import 'package:dartz/dartz.dart';

import '../../../../core/models/user.dart';
import '../../../../core/utils/database_helper.dart';
import '../../../../core/utils/service_locator.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signIn(User user) async {
    final db = await getIt.get<DatabaseHelper>().initDatabase();
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [user.email, user.password],
    );
    if (result.isNotEmpty) {
      return right('Sign In Was Successfull');
    } else {
      return left('User Not Found');
    }
  }

  @override
  Future<Either> signUp(User user) async {
    final db = await getIt.get<DatabaseHelper>().initDatabase();
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [user.email],
    );
    if (result.isNotEmpty) {
      return left('Email already exists');
    } else {
      await db.insert('users', user.toMap());
      return right('Sign Up Was Successfull');
    }
  }
}
