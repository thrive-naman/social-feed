import 'package:auto_route/auto_route.dart';
import 'package:ig_basic_display/view/authentication/spotify/spotify_view.dart';
import 'package:ig_basic_display/view/authentication/spotify/view.dart';
import '../../view/authentication/instagram/instagram_view.dart';
import '../../view/authentication/login/login_view.dart';
import '../../view/home/home_view.dart';
import '../../view/profile/profile_view.dart';
// part './routes.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginView),
    AutoRoute(page: InstagramView),
    AutoRoute(page: ProfileView),
    AutoRoute(page: SpotifyView),
    AutoRoute(page: ProfileView),
    // AutoRoute(page: ProfileView),
    AutoRoute(page: HomeView, initial: true),
  ],
)
class $AppRouter {}
