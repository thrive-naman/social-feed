import 'package:flutter/material.dart';
import 'package:ig_basic_display/core/utils/constants.dart';
import 'package:ig_basic_display/view/authentication/spotify/spotify_model.dart';
import 'package:ig_basic_display/view/authentication/spotify/spotify_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SpotifyView extends StatefulWidget {
  const SpotifyView({Key? key}) : super(key: key);

  @override
  _SpotifyViewState createState() => _SpotifyViewState();
}

class _SpotifyViewState extends State<SpotifyView> {
  final SpotifyViewModel spotifyViewModel = SpotifyViewModel(
    spotifyModel: SpotifyModel(),
  );

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return webView;
    });
  }

  Scaffold get webView => Scaffold(
        appBar: appBar,
        body: WebView(
          initialUrl: SpotifyConstant().authUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: spotifyViewModel.onWebViewCreated,
          navigationDelegate: spotifyViewModel.navigationDelegate,
          // onPageFinished: (String url) => _handleAuthorizationResponse(url),
        ),
      );

  AppBar get appBar => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Spotify Auth',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      );
}
