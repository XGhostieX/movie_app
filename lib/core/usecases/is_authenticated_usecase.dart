import '../../features/auth/data/repos/auth_repo.dart';
import '../utils/service_locator.dart';
import 'usecase.dart';

class IsAuthenticatedUsecase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await getIt<AuthRepo>().isAuthenticated();
  }
}
