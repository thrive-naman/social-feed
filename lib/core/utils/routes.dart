import 'package:auto_route/auto_route.dart';
import 'package:ig_basic_display/view/authentication/spotify/spotify_view.dart';
import '../../view/authentication/instagram/instagram_view.dart';
import '../../view/home/home_view.dart';
import '../../view/splash/splash_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InstagramView),
    AutoRoute(page: SpotifyView),
    AutoRoute(page: HomeView),
    AutoRoute(page: SplashView, initial: true),
  ],
)
class $AppRouter {}
