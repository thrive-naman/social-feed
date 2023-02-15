// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:ig_basic_display/view/authentication/instagram/instagram_view.dart'
    as _i1;
import 'package:ig_basic_display/view/authentication/spotify/spotify_view.dart'
    as _i2;
import 'package:ig_basic_display/view/home/home_view.dart' as _i3;
import 'package:ig_basic_display/view/splash/splash_view.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    InstagramRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.InstagramView(),
      );
    },
    SpotifyRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SpotifyView(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.SplashView(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          InstagramRoute.name,
          path: '/instagram-view',
        ),
        _i5.RouteConfig(
          SpotifyRoute.name,
          path: '/spotify-view',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i5.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.InstagramView]
class InstagramRoute extends _i5.PageRouteInfo<void> {
  const InstagramRoute()
      : super(
          InstagramRoute.name,
          path: '/instagram-view',
        );

  static const String name = 'InstagramRoute';
}

/// generated route for
/// [_i2.SpotifyView]
class SpotifyRoute extends _i5.PageRouteInfo<void> {
  const SpotifyRoute()
      : super(
          SpotifyRoute.name,
          path: '/spotify-view',
        );

  static const String name = 'SpotifyRoute';
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key? key})
      : super(
          HomeRoute.name,
          path: '/home-view',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}
