// import 'dart:convert';
// import 'package:ig_basic_display/view/authentication/spotify/spotify_model.dart';

// import '../../../core/utils/constants.dart';
// import '../../../view/authentication/instagram/instagram_model.dart';
// import '../../main.dart';
// import 'package:http/http.dart' as http;

// class SpotifyProfileViewmodel {
//   SpotifyProfileViewmodel(this.spotifyModel);

//   final SpotifyModel spotifyModel;

//   Future<List<String>?> getUserProfile() async {
//     final fields = AppConstant.userFields.join(',');
//     final responseNode = await http.get(
//       Uri.parse(
//           'https://graph.instagram.com/${spotifyModel.userID}?fields=$fields&access_token=${spotifyModel.accessToken}'),
//     );
//     spotifyModel.username = json.decode(responseNode.body)['username'];
//     spotifyModel.medias = json.decode(responseNode.body)['media']['data'];
//     spotifyModel.mediaUrlList = [];
//     for (int i = 0; i < spotifyModel.medias!.length; i++) {
//       dynamic media = spotifyModel.medias![i]['id'];
//       final responseNode2 = await http.get(Uri.parse(
//           'https://graph.instagram.com/$media?access_token=${spotifyModel.accessToken}&fields=media_url,media_type,thumbnail_url,children'));
//       String mediaType = json.decode(responseNode2.body)['media_type'];

//       switch (mediaType) {
//         case 'IMAGE':
//           spotifyModel.mediaUrlList!
//               .add(json.decode(responseNode2.body)['media_url']);
//           break;
//         case 'VIDEO':
//           spotifyModel.mediaUrlList!
//               .add(json.decode(responseNode2.body)['thumbnail_url']);
//           break;
//         case 'CAROUSEL_ALBUM':
//           spotifyModel.mediaUrlList!
//               .add(json.decode(responseNode2.body)['media_url']);
//           break;
//       }
//     }

//     print('username: ${spotifyModel.username}');
//     return spotifyModel.mediaUrlList!;
//   }

//   static void logout() {
//     router.popUntilRoot();
//   }
// }
