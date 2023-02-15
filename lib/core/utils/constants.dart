import 'package:ig_basic_display/core/utils/secret_constants.dart';

class AppConstant {
  static const String redirectUri = 'https://www.google.com/';
  static const String scope = 'user_profile,user_media';
  static const String responseType = 'code';
  static const List<String> userFields = ['id', 'username', 'media'];
  final String authUrl =
      'https://api.instagram.com/oauth/authorize?client_id=${SecretConstant.clientID}&redirect_uri=$redirectUri&scope=user_profile,user_media&response_type=$responseType';
}


class SpotifyConstant {
  static const String redirectUri = 'https://www.google.com/';
  static const String scope = 'user_profile,user_media';
  static const String responseType = 'code';
  static const List<String> userFields = ['id', 'username', 'media'];
  final  String authUrl =
      'https://accounts.spotify.com/authorize?client_id=${SecretConstant.spotifyClientID}&response_type=code&redirect_uri=$redirectUri&scope=user-read-private%20user-read-email%20user-read-recently-played';
}
