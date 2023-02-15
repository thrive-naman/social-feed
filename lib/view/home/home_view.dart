import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../authentication/login_viewmodel.dart';
import '../splash/splash_view.dart';

class HomeView extends StatefulWidget {
  final savedData = GetStorage();

  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();

  Widget buildGridView() {
    List<Widget> widgets = mediaUrlList!
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(1),
            child: Image.network(e),
          ),
        )
        .toList();
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: widgets,
    );
  }

  Widget buildSpotifyView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                  child: Image.network(userDataModel!.images[0].url),
                  radius: 50),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userDataModel!.displayName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        userDataModel!.email,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        'Followers: ',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(userDataModel!.followers.total.toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSongsView(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recentSongs!.items.length,
      itemBuilder: (context, index) => ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          child: Image.network(
              recentSongs!.items[index].track.album.images[0].url),
        ),
        title: Text(recentSongs!.items[index].track.name),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 100,
                child: Text(recentSongs!.items[index].track.artists[0].name)),
            SizedBox(
                width: 200,
                child: Text(recentSongs!.items[index].track.album.name)),
          ],
        ),
      ),
    );
  }
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: mediaUrlList == null
                  ? LoginViewmodel.onInstaPressed
                  : () {
                      mediaUrlList = null;
                      widget.savedData.remove('INSTA');
                      setState(() {});
                    },
              label: Row(
                children: [
                  const Icon(FontAwesomeIcons.instagram),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(mediaUrlList == null ? 'Login' : 'Logout')
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton.extended(
              onPressed: userDataModel == null
                  ? LoginViewmodel.onSpotifyPressed
                  : () {
                      userDataModel = null;
                      recentSongs = null;

                      widget.savedData.remove('SPOTIFY_USER_DATA');
                      widget.savedData.remove('SPOTIFY_MUSIC_DATA');

                      setState(() {});
                    },
              label: Row(
                children: [
                  const Icon(FontAwesomeIcons.spotify),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(userDataModel == null ? 'Login' : 'Logout')
                ],
              ),
            ),
          ],
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'FeedCheck',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                // icon: FaIcon(FontAwesomeIcons.instagram),
                // text: 'Instagram',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Instagram')
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.spotify,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Spotify')
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          mediaUrlList == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bomb,
                        size: 50,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No Data Found',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Login to Instagram to see your feed',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: widget.buildGridView()),
          userDataModel == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bomb,
                        size: 50,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No Data Found',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Login to Spotify to see your feed',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.buildSpotifyView(context),
                        widget.buildSongsView(context),
                      ],
                    ),
                  )),
        ]));
  }
}
