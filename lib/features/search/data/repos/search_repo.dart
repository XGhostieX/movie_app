import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either> fetchSearchMovies(String qurey);
  Future<Either> fetchSearchTv(String qurey);
}
