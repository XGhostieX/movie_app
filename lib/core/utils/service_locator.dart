// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get_it/get_it.dart';

// import '../../features/home/data/repos/home_repo_impl.dart';
// import 'firebase_service.dart';

// final getIt = GetIt.instance;

// void setup() {
//   getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
//   getIt.registerSingleton<FirebaseService>(
//     FirebaseService(firestore: getIt.get<FirebaseFirestore>()),
//   );
//   getIt.registerSingleton<HomeRepoImpl>(
//     HomeRepoImpl(
//       getIt.get<FirebaseService>(),
//     ),
//   );
// }
