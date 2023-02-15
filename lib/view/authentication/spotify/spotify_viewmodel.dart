import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ig_basic_display/view/profile/spotify_profile_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/utils/secret_constants.dart';
import '../../../core/utils/routes.gr.dart';
import '../../../main.dart';
import '../../../core/utils/constants.dart';
import '../../splash/splash_view.dart';
import 'spotify_model.dart';

class SpotifyViewModel extends ChangeNotifier {
  SpotifyViewModel({required this.spotifyModel});

  final SpotifyModel spotifyModel;

  UniqueKey toSpotify = UniqueKey();

  Completer<WebViewController> controller = Completer<WebViewController>();

  void buildRedirectToHome(NavigationRequest navigation) async {
    final host = Uri.parse(navigation.url).toString();

    if (host.contains(Uri.parse(SpotifyConstant.redirectUri).host)) {
      debugPrint(host);
      await getAuthorizationCode(host);
      await getTokenAndUserID().then(
        (isDone) async {
          final savedData = GetStorage();
          if (isDone) {
            SpotifyProfileViewmodel(spotifyModel).getUserData().then(
              (userData) {
                userDataModel = userData;
                savedData.write('SPOTIFY_USER_DATA', userData);

                SpotifyProfileViewmodel(spotifyModel).getRecentSongs().then(
                  (playedSongs) {
                    recentSongs = playedSongs;
                    savedData.write(
                        'SPOTIFY_MUSIC_DATA', playedSongs);

                    router.push(
                       HomeRoute(),
                    );
                  },
                );
              },
            );
          }
        },
      );
    }
  }

  Future<void> getAuthorizationCode(String url) async {
    spotifyModel.authorizationCode =
        url.replaceAll('${SpotifyConstant.redirectUri}?code=', '');
    debugPrint("Replaced state  =====>>>>> " +
        spotifyModel.authorizationCode.toString());
  }

  String tokenEndpoint = 'https://accounts.spotify.com/api/token';

  String basicAuth = 'Basic ' +
      base64Encode(utf8.encode(
          '${SecretConstant.spotifyClientID}:${SecretConstant.spotifyAppSecret}'));

  Future<bool> getTokenAndUserID() async {
    Uri url = Uri.parse('https://accounts.spotify.com/api/token');

    await http.post(url, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': basicAuth,
    }, body: {
      'grant_type': 'authorization_code',
      'code': spotifyModel.authorizationCode.toString(),
      'redirect_uri': SpotifyConstant.redirectUri,
    }).then((response) {
      if (response.statusCode == 200) {

        var data = jsonDecode(response.body);
        spotifyModel.accessToken = data['access_token'].toString();
        spotifyModel.refreshToken = data['refresh_token'].toString();

      } else {

        debugPrint('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((error) {

      debugPrint(error);
    });

    return (spotifyModel.accessToken != null &&
        spotifyModel.refreshToken != null);
  }
  void onWebViewCreated(WebViewController c) {
    controller.complete(c);
  }

  NavigationDecision navigationDelegate(NavigationRequest navigation) {
    buildRedirectToHome(navigation);
    return NavigationDecision.navigate;
  }
}
