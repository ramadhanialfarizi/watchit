class MorePeopleModel {
  MorePeopleModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory MorePeopleModel.fromJson(Map<String, dynamic> json) =>
      MorePeopleModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  bool? adult;
  int? gender;
  int? id;
  List<KnownFor>? knownFor;
  KnownForDepartment? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownFor: json["known_for"] == null
            ? []
            : List<KnownFor>.from(
                json["known_for"]!.map((x) => KnownFor.fromJson(x))),
        knownForDepartment:
            knownForDepartmentValues.map[json["known_for_department"]]!,
        name: json["name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for": knownFor == null
            ? []
            : List<dynamic>.from(knownFor!.map((x) => x.toJson())),
        "known_for_department":
            knownForDepartmentValues.reverse[knownForDepartment],
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}

class KnownFor {
  KnownFor({
    this.adult,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.backdropPath,
    this.firstAirDate,
    this.name,
    this.originCountry,
    this.originalName,
  });

  bool? adult;
  List<int>? genreIds;
  int? id;
  MediaType? mediaType;
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? backdropPath;
  DateTime? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        originalLanguage:
            originalLanguageValues.map[json["original_language"]]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        backdropPath: json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        name: json["name"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "name": name,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_name": originalName,
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { KO, EN, IT, TR, TL }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "it": OriginalLanguage.IT,
  "ko": OriginalLanguage.KO,
  "tl": OriginalLanguage.TL,
  "tr": OriginalLanguage.TR
});

enum KnownForDepartment { ACTING, DIRECTING, WRITING }

final knownForDepartmentValues = EnumValues({
  "Acting": KnownForDepartment.ACTING,
  "Directing": KnownForDepartment.DIRECTING,
  "Writing": KnownForDepartment.WRITING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
