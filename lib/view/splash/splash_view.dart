import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ig_basic_display/main.dart';

import '../../core/utils/routes.gr.dart';
import '../profile/songs_data_model.dart';
import '../profile/spotify_user_data_model.dart';

List<String>? mediaUrlList;
SpotifyUserDataModel? userDataModel;
SongsDataModel? recentSongs;

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        Tween<double>(begin: 1.0, end: 1.8).animate(_animationController);
    Timer(const Duration(milliseconds: 500), () async {
      getUserData();

      await _animationController.forward();
      router.push(HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Vector.svg',
                  height: 100, width: 100),
              const Text('Social Feed',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

getUserData() {
  final savedData = GetStorage();
  if (savedData.read('SPOTIFY_USER_DATA') != null) {
    userDataModel =
        SpotifyUserDataModel.fromJson(savedData.read('SPOTIFY_USER_DATA'));
    recentSongs = SongsDataModel.fromJson(savedData.read('SPOTIFY_MUSIC_DATA'));
  }

  if (savedData.read('INSTA') != null) {
    mediaUrlList = List.castFrom(savedData.read('INSTA'));
  }
}
