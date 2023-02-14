// To parse this JSON data, do
//
//     final spotifyUserDataModel = spotifyUserDataModelFromJson(jsonString);

import 'dart:convert';

SpotifyUserDataModel spotifyUserDataModelFromJson(String str) => SpotifyUserDataModel.fromJson(json.decode(str));

String spotifyUserDataModelToJson(SpotifyUserDataModel data) => json.encode(data.toJson());

class SpotifyUserDataModel {
    SpotifyUserDataModel({
        required this.country,
        required this.displayName,
        required this.email,
        required this.explicitContent,
        required this.externalUrls,
        required this.followers,
        required this.href,
        required this.id,
        required this.images,
        required this.product,
        required this.type,
        required this.uri,
    });

    String country;
    String displayName;
    String email;
    ExplicitContent explicitContent;
    ExternalUrls externalUrls;
    Followers followers;
    String href;
    String id;
    List<Image> images;
    String product;
    String type;
    String uri;

    factory SpotifyUserDataModel.fromJson(Map<String, dynamic> json) => SpotifyUserDataModel(
        country: json["country"],
        displayName: json["display_name"],
        email: json["email"],
        explicitContent: ExplicitContent.fromJson(json["explicit_content"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        product: json["product"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "display_name": displayName,
        "email": email,
        "explicit_content": explicitContent.toJson(),
        "external_urls": externalUrls.toJson(),
        "followers": followers.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "product": product,
        "type": type,
        "uri": uri,
    };
}

class ExplicitContent {
    ExplicitContent({
        required this.filterEnabled,
        required this.filterLocked,
    });

    bool filterEnabled;
    bool filterLocked;

    factory ExplicitContent.fromJson(Map<String, dynamic> json) => ExplicitContent(
        filterEnabled: json["filter_enabled"],
        filterLocked: json["filter_locked"],
    );

    Map<String, dynamic> toJson() => {
        "filter_enabled": filterEnabled,
        "filter_locked": filterLocked,
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

class Followers {
    Followers({
        this.href,
        required this.total,
    });

    dynamic href;
    int total;

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
    };
}

class Image {
    Image({
        this.height,
        required this.url,
        this.width,
    });

    dynamic height;
    String url;
    dynamic width;

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
