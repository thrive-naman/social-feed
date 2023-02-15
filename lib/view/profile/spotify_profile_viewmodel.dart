import 'package:flutter/material.dart';
import 'package:ig_basic_display/view/authentication/spotify/spotify_model.dart';
import 'package:ig_basic_display/view/profile/songs_data_model.dart';
import 'package:ig_basic_display/view/profile/spotify_user_data_model.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;

class SpotifyProfileViewmodel {
  SpotifyProfileViewmodel(this.spotifyModel);

  final SpotifyModel spotifyModel;

  Future<SpotifyUserDataModel> getUserData() async {
    Uri url = Uri.parse('https://api.spotify.com/v1/me');
    late SpotifyUserDataModel userDataModel;
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${spotifyModel.accessToken}',
    }).then((response) {
      if (response.statusCode == 200) {
        userDataModel = spotifyUserDataModelFromJson(response.body);
      } else {
        debugPrint('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((error) {
      debugPrint(error);
    });
    return userDataModel;
  }

  Future<SongsDataModel> getRecentSongs() async {
    Uri url = Uri.parse('https://api.spotify.com/v1/me/player/recently-played');
    late SongsDataModel recentlyPlayedSongs;
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${spotifyModel.accessToken}',
    }).then((response) {
      if (response.statusCode == 200) {
        recentlyPlayedSongs = songsDataModelFromJson(response.body);
      } else {}
    }).catchError((error) {
      debugPrint(error);
    });
    return recentlyPlayedSongs;
  }

  static void onLogoutPressed() {
    router.popUntilRoot();
  }
}
