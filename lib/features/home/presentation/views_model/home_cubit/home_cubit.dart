// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/models/car.dart';
// import '../../../data/repos/home_repo.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit(this.homeRepo) : super(HomeInitial());
//   final HomeRepo homeRepo;

//   Future<void> fetchCars() async {
//     emit(HomeLoading());
//     try {
//       var result = await homeRepo.fetchCars();
//       emit(HomeSuccess(result));
//     } catch (e) {
//       emit(HomeFailure(e.toString()));
//     }
//   }
// }
