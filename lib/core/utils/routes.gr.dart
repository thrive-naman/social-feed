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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:ig_basic_display/view/authentication/instagram/instagram_view.dart'
    as _i2;
import 'package:ig_basic_display/view/authentication/login/login_view.dart'
    as _i1;
import 'package:ig_basic_display/view/authentication/spotify/spotify_view.dart'
    as _i4;
import 'package:ig_basic_display/view/home/home_view.dart' as _i5;
import 'package:ig_basic_display/view/profile/profile_view.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginView(),
      );
    },
    InstagramRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.InstagramView(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.ProfileView(
          key: args.key,
          mediaUrlList: args.mediaUrlList,
        ),
      );
    },
    SpotifyRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.SpotifyView(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeView(
          key: args.key,
          mediaUrlList: args.mediaUrlList,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        _i6.RouteConfig(
          InstagramRoute.name,
          path: '/instagram-view',
        ),
        _i6.RouteConfig(
          ProfileRoute.name,
          path: '/profile-view',
        ),
        _i6.RouteConfig(
          SpotifyRoute.name,
          path: '/spotify-view',
        ),
        _i6.RouteConfig(
          ProfileRoute.name,
          path: '/profile-view',
        ),
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.InstagramView]
class InstagramRoute extends _i6.PageRouteInfo<void> {
  const InstagramRoute()
      : super(
          InstagramRoute.name,
          path: '/instagram-view',
        );

  static const String name = 'InstagramRoute';
}

/// generated route for
/// [_i3.ProfileView]
class ProfileRoute extends _i6.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i7.Key? key,
    List<String>? mediaUrlList,
  }) : super(
          ProfileRoute.name,
          path: '/profile-view',
          args: ProfileRouteArgs(
            key: key,
            mediaUrlList: mediaUrlList,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.mediaUrlList,
  });

  final _i7.Key? key;

  final List<String>? mediaUrlList;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, mediaUrlList: $mediaUrlList}';
  }
}

/// generated route for
/// [_i4.SpotifyView]
class SpotifyRoute extends _i6.PageRouteInfo<void> {
  const SpotifyRoute()
      : super(
          SpotifyRoute.name,
          path: '/spotify-view',
        );

  static const String name = 'SpotifyRoute';
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i6.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i7.Key? key,
    List<String>? mediaUrlList,
  }) : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(
            key: key,
            mediaUrlList: mediaUrlList,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.mediaUrlList,
  });

  final _i7.Key? key;

  final List<String>? mediaUrlList;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, mediaUrlList: $mediaUrlList}';
  }
}
