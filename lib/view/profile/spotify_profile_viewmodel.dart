import 'dart:convert';
import 'package:ig_basic_display/view/authentication/spotify/spotify_model.dart';
import 'package:ig_basic_display/view/profile/songs_data_model.dart';
import 'package:ig_basic_display/view/profile/spotify_user_data_model.dart';

import '../../../core/utils/constants.dart';
import '../../../view/authentication/instagram/instagram_model.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;

class SpotifyProfileViewmodel {
  SpotifyProfileViewmodel(this.spotifyModel);

  final SpotifyModel spotifyModel;

  // Future<List<String>?> getUserProfile() async {
  //   final fields = AppConstant.userFields.join(',');
  //   final responseNode = await http.get(
  //     Uri.parse(
  //         'https://graph.instagram.com/${spotifyModel.userID}?fields=$fields&access_token=${spotifyModel.accessToken}'),
  //   );
  //   spotifyModel.username = json.decode(responseNode.body)['username'];
  //   spotifyModel.medias = json.decode(responseNode.body)['media']['data'];
  //   spotifyModel.mediaUrlList = [];
  //   for (int i = 0; i < spotifyModel.medias!.length; i++) {
  //     dynamic media = spotifyModel.medias![i]['id'];
  //     final responseNode2 = await http.get(Uri.parse(
  //         'https://graph.instagram.com/$media?access_token=${spotifyModel.accessToken}&fields=media_url,media_type,thumbnail_url,children'));
  //     String mediaType = json.decode(responseNode2.body)['media_type'];

  //     switch (mediaType) {
  //       case 'IMAGE':
  //         spotifyModel.mediaUrlList!
  //             .add(json.decode(responseNode2.body)['media_url']);
  //         break;
  //       case 'VIDEO':
  //         spotifyModel.mediaUrlList!
  //             .add(json.decode(responseNode2.body)['thumbnail_url']);
  //         break;
  //       case 'CAROUSEL_ALBUM':
  //         spotifyModel.mediaUrlList!
  //             .add(json.decode(responseNode2.body)['media_url']);
  //         break;
  //     }
  //   }

  //   print('username: ${spotifyModel.username}');
  //   return spotifyModel.mediaUrlList!;
  // }




Future<SpotifyUserDataModel> getUserData() async {
    Uri url = Uri.parse('https://api.spotify.com/v1/me');
late SpotifyUserDataModel userDataModel;
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${spotifyModel.accessToken}',
    }).then((response) {
      if (response.statusCode == 200) {
        // parse the JSON response

         userDataModel =
            spotifyUserDataModelFromJson(response.body);
        // var data = jsonDecode(response.body);

        // extract the access token and refresh token

        print('::::::::::::::::::::::::::::::::::::');
        print(userDataModel.displayName);
        print(userDataModel.country);
        print(userDataModel.email);
        print(userDataModel.images[0].url);
        print(':::::::::::::::::::::::::::::::::::::');

        // do something with the tokens
      } else {
        // handle any errors that occur
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((error) {
      // handle any errors that occur
      print(error);
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
        // parse the JSON response

         recentlyPlayedSongs =
            songsDataModelFromJson(response.body);
        // var data = jsonDecode(response.body);

        // extract the access token and refresh token

        print('::::::::::::::::::::::::::::::::::::');
        print(recentlyPlayedSongs.items[0].track.name);
        print(recentlyPlayedSongs.items[0].track.album.name );
        print(recentlyPlayedSongs.items[0].track.artists);
        print(recentlyPlayedSongs.items[0].track.href);
        print(recentlyPlayedSongs.items[0].track.album.images[0].url);
     
        print(':::::::::::::::::::::::::::::::::::::');

        // do something with the tokens
      } else {
        // handle any errors that occur
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    }).catchError((error) {
      // handle any errors that occur
      print(error);
    });
    return recentlyPlayedSongs;
  }


  static void logout() {
    router.popUntilRoot();
  }
}
