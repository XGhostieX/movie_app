import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either> fetchMovies(String qurey);
  Future<Either> fetchTv(String qurey);
}
