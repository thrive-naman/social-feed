class SpotifyModel {
  SpotifyModel({
    this.authorizationCode,
    this.accessToken,
    this.refreshToken,
  });

  String? authorizationCode;
  String? accessToken;
  String? refreshToken;
}
