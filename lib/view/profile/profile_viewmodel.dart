import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../view/authentication/instagram/instagram_model.dart';
import 'package:http/http.dart' as http;
import '../splash/splash_view.dart';

class ProfileViewmodel {
  ProfileViewmodel(this.instagramModel);

  final InstagramModel instagramModel;

  Future<List<String>?> getUserProfile() async {

final savedData = GetStorage();

    final fields = AppConstant.userFields.join(',');
    final responseNode = await http.get(
      Uri.parse(
          'https://graph.instagram.com/${instagramModel.userID}?fields=$fields&access_token=${instagramModel.accessToken}'),
    );
    instagramModel.username = json.decode(responseNode.body)['username'];
    instagramModel.medias = json.decode(responseNode.body)['media']['data'];
    instagramModel.mediaUrlList = [];
    for (int i = 0; i < instagramModel.medias!.length; i++) {
      dynamic media = instagramModel.medias![i]['id'];
      final responseNode2 = await http.get(Uri.parse(
          'https://graph.instagram.com/$media?access_token=${instagramModel.accessToken}&fields=media_url,media_type,thumbnail_url,children'));
      String mediaType = json.decode(responseNode2.body)['media_type'];

      switch (mediaType) {
        case 'IMAGE':
          instagramModel.mediaUrlList!
              .add(json.decode(responseNode2.body)['media_url']);
          break;
        case 'VIDEO':
          instagramModel.mediaUrlList!
              .add(json.decode(responseNode2.body)['thumbnail_url']);
          break;
        case 'CAROUSEL_ALBUM':
          instagramModel.mediaUrlList!
              .add(json.decode(responseNode2.body)['media_url']);
          break;
      }
    }
    savedData.write('INSTA', instagramModel.mediaUrlList);
    return instagramModel.mediaUrlList!;
  }

  static void onLogoutPressed() {
    // router.popUntilRoot();
    mediaUrlList = null;
  }
}
