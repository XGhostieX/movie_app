import 'package:dartz/dartz.dart';

import '../../../../core/models/cast.dart';
import '../../../../core/models/genre.dart';
import '../../../../core/models/review/review.dart';
import '../../../../core/models/trailer.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/mapper.dart';
import 'details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  final ApiService apiService;
  final Mapper mapper;

  DetailsRepoImpl(this.apiService, this.mapper);
  @override
  Future<Either> fetchTrailer(String endPoint) async {
    try {
      var data = await apiService.get(endPoint: endPoint);
      List<Trailer> trailers = mapper.trailerMapper(data);
      return right(trailers[0]);
    } catch (e) {
      return const Left("Trailer isn't Available");
    }
  }

  @override
  Future<Either> fetchGenres(String endPoint) async {
    try {
      var data = await apiService.get(endPoint: endPoint);
      List<Genre> genres = mapper.genresMapper(data);
      return right(genres);
    } catch (e) {
      return const Left("Genres isn't Available");
    }
  }

  @override
  Future<Either> fetchCast(String endPoint) async {
    try {
      var data = await apiService.get(endPoint: endPoint);
      List<Cast> cast = mapper.castMapper(data);
      return right(cast);
    } catch (e) {
      return const Left("Cast isn't Available");
    }
  }

  @override
  Future<Either> fetchReviews(String endPoint) async {
    try {
      var data = await apiService.get(endPoint: endPoint);
      List<Review> reviews = mapper.reviewsMapper(data);
      return right(reviews);
    } catch (e) {
      return const Left("Reviews isn't Available");
    }
  }
}
