import 'package:dartz/dartz.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../models/auth.dart';
import '../utils/service_locator.dart';
import 'usecase.dart';

class SignupUsecase extends Usecase<Either, Auth> {
  @override
  Future<Either> call({Auth? params}) async {
    return await getIt<AuthRepo>().signup(params!);
  }
}
