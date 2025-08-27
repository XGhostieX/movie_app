import 'package:dartz/dartz.dart';

import '../../../../core/models/user.dart';
import '../../../../core/utils/database_helper.dart';
import 'auth_local_datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<Either> signIn(User user) async {
    final db = await databaseHelper.database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [user.email, user.password],
    );
    if (result.isNotEmpty) {
      databaseHelper.close();
      return right('Sign In Was Successfull');
    } else {
      return left('User Not Found');
    }
  }

  @override
  Future<Either> signUp(User user) async {
    final db = await databaseHelper.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [user.email],
    );
    if (result.isNotEmpty) {
      return left('Email already exists');
    } else {
      await db.insert('users', user.toMap());
      databaseHelper.close();
      return right('Sign Up Was Successfull');
    }
  }
}
