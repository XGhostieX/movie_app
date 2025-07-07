import 'dart:convert';

import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<dynamic>? genreIds;
  final int? id;
  final List<dynamic>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  const Tv({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory Tv.fromMap(Map<String, dynamic> data) => Tv(
    adult: data['adult'] as bool?,
    backdropPath: data['backdrop_path'] as String?,
    genreIds: data['genre_ids'] as List<dynamic>?,
    id: data['id'] as int?,
    originCountry: data['origin_country'] as List<dynamic>?,
    originalLanguage: data['original_language'] as String?,
    originalName: data['original_name'] as String?,
    overview: data['overview'] as String?,
    popularity: (data['popularity'] as num?)?.toDouble(),
    posterPath: data['poster_path'] as String?,
    firstAirDate: data['first_air_date'] as String?,
    name: data['name'] as String?,
    voteAverage: (data['vote_average'] as num?)?.toDouble(),
    voteCount: data['vote_count'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'origin_country': originCountry,
    'original_language': originalLanguage,
    'original_name': originalName,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'first_air_date': firstAirDate,
    'name': name,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tv].
  factory Tv.fromJson(String data) {
    return Tv.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tv] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originCountry,
      originalLanguage,
      originalName,
      overview,
      popularity,
      posterPath,
      firstAirDate,
      name,
      voteAverage,
      voteCount,
    ];
  }
}
