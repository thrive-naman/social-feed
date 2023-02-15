import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ig_basic_display/view/home/home_view.dart';
import 'package:ig_basic_display/view/profile/spotify_profile_viewmodel.dart';
import 'package:ig_basic_display/view/profile/spotify_user_data_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/utils/secret_constants.dart';
import '../../../core/utils/routes.gr.dart';
import '../../../main.dart';
import '../../profile/profile_viewmodel.dart';
import '../../../core/utils/constants.dart';
import 'spotify_model.dart';

class SpotifyViewModel extends ChangeNotifier {
  SpotifyViewModel({required this.spotifyModel});

  final SpotifyModel spotifyModel;

  UniqueKey toSpotify = UniqueKey();

  Completer<WebViewController> controller = Completer<WebViewController>();

  void buildRedirectToHome(NavigationRequest navigation) async {
    final host = Uri.parse(navigation.url).toString();

    if (host.contains(Uri.parse(SpotifyConstant.redirectUri).host))  {
      print(host);
      await  getAuthorizationCode(host);
      await getTokenAndUserID().then(
        (isDone) async {
          if (isDone) {
            // await getUserData().then((value) => print(
            //     '___________________________________________________________'));
       

             SpotifyProfileViewmodel(spotifyModel).getUserData().then(
              
              (userData) {

                userDataModel = userData;

                    SpotifyProfileViewmodel(spotifyModel).getRecentSongs().then(
              
              (playedSongs) {

                recentSongs = playedSongs;


                router.push(
                  HomeRoute(
                  
                  ),
                );
            },
            );
               
            },
            );

         
          }
          print(isDone);
          print('else condition ran !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        },
      );
    }
  }

  Future<void> getAuthorizationCode(String url) async {
    spotifyModel.authorizationCode =
        await url.replaceAll('${SpotifyConstant.redirectUri}?code=', '');
    print("Replaced state  =====>>>>> " + spotifyModel.authorizationCode.toString());
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
    }).then((response)  {
   if (response.statusCode == 200)  {
        // parse the JSON response
        print(response.statusCode);
        var data = jsonDecode(response.body);
        print(data);

        // extract the access token and refresh token
        spotifyModel.accessToken = data['access_token'].toString();
 print(spotifyModel.accessToken);
spotifyModel.refreshToken = data['refresh_token'].toString();
 print(spotifyModel.refreshToken);
// do something with the tokens
      } else {
       // handle any errors that occur
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((error) {
      // handle any errors that occur
      print(error);
    });

    return (spotifyModel.accessToken != null &&
        spotifyModel.refreshToken != null);
  }

  // Future<bool> getUserData() async {
  //   Uri url = Uri.parse('https://api.spotify.com/v1/me');

  //   http.get(url, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${spotifyModel.accessToken}',
  //   }).then((response) {
  //     if (response.statusCode == 200) {
  //       // parse the JSON response

  //       SpotifyUserDataModel userDataModel =
  //           spotifyUserDataModelFromJson(response.body);
  //       // var data = jsonDecode(response.body);

  //       // extract the access token and refresh token

  //       print('::::::::::::::::::::::::::::::::::::');
  //       print(userDataModel.displayName);
  //       print(userDataModel.country);
  //       print(userDataModel.email);
  //       print(userDataModel.images[0].url);
  //       print(':::::::::::::::::::::::::::::::::::::');

  //       // do something with the tokens
  //     } else {
  //       // handle any errors that occur
  //       print('Error ${response.statusCode}: ${response.reasonPhrase}');
  //     }
  //   }).catchError((error) {
  //     // handle any errors that occur
  //     print(error);
  //   });
  //   return (spotifyModel.accessToken != null &&
  //           spotifyModel.refreshToken != null)
  //       ? true
  //       : false;
  // }

  void onWebViewCreated(WebViewController c) {
    controller.complete(c);
  }

  NavigationDecision navigationDelegate(NavigationRequest navigation) {
    buildRedirectToHome(navigation);
    return NavigationDecision.navigate;
  }
}
