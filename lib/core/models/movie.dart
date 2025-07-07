import 'dart:convert';

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<dynamic>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromMap(Map<String, dynamic> data) => Movie(
    adult: data['adult'] as bool?,
    backdropPath: data['backdrop_path'] as String?,
    genreIds: data['genre_ids'] as List<dynamic>?,
    id: data['id'] as int?,
    originalLanguage: data['original_language'] as String?,
    originalTitle: data['original_title'] as String?,
    overview: data['overview'] as String?,
    popularity: (data['popularity'] as num?)?.toDouble(),
    posterPath: data['poster_path'] as String?,
    releaseDate: data['release_date'] as String?,
    title: data['title'] as String?,
    video: data['video'] as bool?,
    voteAverage: (data['vote_average'] as num?)?.toDouble(),
    voteCount: data['vote_count'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Movie].
  factory Movie.fromJson(String data) {
    return Movie.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Movie] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
    ];
  }
}
