import 'package:dartz/dartz.dart';

import '../../../../core/models/cast.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/review/review.dart';
import '../../../../core/models/trailer.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/mapper.dart';
import '../../../../core/utils/service_locator.dart';
import 'details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  @override
  Future<Either> fetchTrailer(String endPoint) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: endPoint);
      List<Trailer> trailers = getIt.get<Mapper>().trailerMapper(data);
      return right(trailers[0]);
    } catch (e) {
      return const Left("Trailer isn't Available");
    }
  }

  @override
  Future<Either> fetchGenres(String endPoint) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: endPoint);
      List<Genre> genres = getIt.get<Mapper>().genresMapper(data);
      return right(genres);
    } catch (e) {
      return const Left("Genres isn't Available");
    }
  }

  @override
  Future<Either> fetchCast(String endPoint) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: endPoint);
      List<Cast> cast = getIt.get<Mapper>().castMapper(data);
      return right(cast);
    } catch (e) {
      return const Left("Cast isn't Available");
    }
  }

  @override
  Future<Either> fetchReviews(String endPoint) async {
    try {
      var data = await getIt.get<ApiService>().get(endPoint: endPoint);
      List<Review> reviews = getIt.get<Mapper>().reviewsMapper(data);
      return right(reviews);
    } catch (e) {
      return const Left("Reviews isn't Available");
    }
  }
}
