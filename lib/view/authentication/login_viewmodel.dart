import 'package:ig_basic_display/core/utils/routes.gr.dart';

import '../../main.dart';

class LoginViewmodel {
  static void onInstaPressed() {
    router.push(const InstagramRoute());
  }

  static void onSpotifyPressed() {
    router.push(const SpotifyRoute());
  }
}
