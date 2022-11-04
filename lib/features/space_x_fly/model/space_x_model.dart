import 'dart:convert';

List<SpaceXModel> spaceXModelFromJson(String str) => List<SpaceXModel>.from(
    json.decode(str).map((x) => SpaceXModel.fromJson(x)));

String spaceXModelToJson(List<SpaceXModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXModel {
  SpaceXModel({
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.links,
    required this.net,
    required this.window,
    required this.success,
    required this.details,
    required this.flightNumber,
    required this.name,
    required this.upcoming,
    required this.autoUpdate,
    required this.tbd,
    required this.id,
  });

  final Links? links; //---------
  final DateTime? staticFireDateUtc;
  final int? staticFireDateUnix;
  final bool? net;
  final int? window;
  final bool? success;
  final String? details; //---------
  final int? flightNumber;
  final String? name; //----------
  final bool? upcoming;
  final bool? autoUpdate;
  final bool? tbd;
  final String? id;

  factory SpaceXModel.fromJson(Map<String, dynamic> json) => SpaceXModel(
        links: Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null
            ? null
            : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        success: json["success"],
        details: json["details"],
        flightNumber: json["flight_number"],
        name: json["name"],
        upcoming: json["upcoming"],
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "links": links?.toJson(),
        "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        "success": success,
        "details": details,
        "flight_number": flightNumber,
        "name": name,
        "upcoming": upcoming,
        "auto_update": autoUpdate,
        "tbd": tbd,
        "id": id,
      };
}

class Links {
  Links({
    required this.patch,
    required this.presskit,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });
  final Patch? patch;
  final String? presskit;
  final String? webcast;
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: Patch.fromJson(json["patch"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "patch": patch?.toJson(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Patch {
  Patch({
    required this.small,
    required this.large,
  });

  final String? small;
  final String? large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"] == null ? null : json["small"],
        large: json["large"] == null ? null : json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small == null ? null : small,
        "large": large == null ? null : large,
      };
}
