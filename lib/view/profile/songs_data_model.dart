
import 'dart:convert';

SongsDataModel songsDataModelFromJson(String str) => SongsDataModel.fromJson(json.decode(str));

String songsDataModelToJson(SongsDataModel data) => json.encode(data.toJson());

class SongsDataModel {
    SongsDataModel({
        required this.items,
        required this.next,
        required this.cursors,
        required this.limit,
        required this.href,
    });

    List<Item> items;
    String next;
    Cursors cursors;
    int limit;
    String href;

    factory SongsDataModel.fromJson(Map<String, dynamic> json) => SongsDataModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        next: json["next"],
        cursors: Cursors.fromJson(json["cursors"]),
        limit: json["limit"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "next": next,
        "cursors": cursors.toJson(),
        "limit": limit,
        "href": href,
    };
}

class Cursors {
    Cursors({
        required this.after,
        required this.before,
    });

    String after;
    String before;

    factory Cursors.fromJson(Map<String, dynamic> json) => Cursors(
        after: json["after"],
        before: json["before"],
    );

    Map<String, dynamic> toJson() => {
        "after": after,
        "before": before,
    };
}

class Item {
    Item({
        required this.track,
        required this.playedAt,
        this.context,
    });

    Track track;
    DateTime playedAt;
    dynamic context;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        track: Track.fromJson(json["track"]),
        playedAt: DateTime.parse(json["played_at"]),
        context: json["context"],
    );

    Map<String, dynamic> toJson() => {
        "track": track.toJson(),
        "played_at": playedAt.toIso8601String(),
        "context": context,
    };
}

class Track {
    Track({
        required this.album,
        required this.artists,
        required this.availableMarkets,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalIds,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isLocal,
        required this.name,
        required this.popularity,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
    });

    Album album;
    List<Artist> artists;
    List<String> availableMarkets;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalIds externalIds;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isLocal;
    String name;
    int popularity;
    String previewUrl;
    int trackNumber;
    TrackType type;
    String uri;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: Album.fromJson(json["album"]),
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: trackTypeValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": trackTypeValues.reverse[type],
        "uri": uri,
    };
}

class Album {
    Album({
        required this.albumType,
        required this.artists,
        required this.availableMarkets,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.totalTracks,
        required this.type,
        required this.uri,
    });

    AlbumTypeEnum albumType;
    List<Artist> artists;
    List<String> availableMarkets;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    DateTime releaseDate;
    ReleaseDatePrecision releaseDatePrecision;
    int totalTracks;
    AlbumTypeEnum type;
    String uri;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: albumTypeEnumValues.map[json["album_type"]]!,
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        totalTracks: json["total_tracks"],
        type: albumTypeEnumValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumTypeEnumValues.reverse[albumType],
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "total_tracks": totalTracks,
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
    };
}

// ignore: constant_identifier_names
enum AlbumTypeEnum { ALBUM, SINGLE }

final albumTypeEnumValues = EnumValues({
    "album": AlbumTypeEnum.ALBUM,
    "single": AlbumTypeEnum.SINGLE
});

class Artist {
    Artist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
    });

    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    ArtistType type;
    String uri;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: artistTypeValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": artistTypeValues.reverse[type],
        "uri": uri,
    };
}

class ExternalUrls {
    ExternalUrls({
        required this.spotify,
    });

    String spotify;

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

// ignore: constant_identifier_names
enum ArtistType { ARTIST }

final artistTypeValues = EnumValues({
    "artist": ArtistType.ARTIST
});

class Image {
    Image({
        required this.height,
        required this.url,
        required this.width,
    });

    int height;
    String url;
    int width;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

// ignore: constant_identifier_names
enum ReleaseDatePrecision { DAY }

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY
});

class ExternalIds {
    ExternalIds({
        required this.isrc,
    });

    String isrc;

    factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
    );

    Map<String, dynamic> toJson() => {
        "isrc": isrc,
    };
}

// ignore: constant_identifier_names
enum TrackType { TRACK }

final trackTypeValues = EnumValues({
    "track": TrackType.TRACK
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
