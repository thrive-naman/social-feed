import 'package:flutter/material.dart';
import 'package:ig_basic_display/view/profile/songs_data_model.dart' as songs;

import '../authentication/login/login_viewmodel.dart' ;
import '../profile/spotify_user_data_model.dart' as spotify;

late  List<String>? mediaUrlList =  null;
  late  spotify.SpotifyUserDataModel? userDataModel = null ;
  late  songs.SongsDataModel? recentSongs = null ;

class HomeView extends StatefulWidget {
  // final List<String>? mediaUrlList;
  // final spotify.SpotifyUserDataModel? userDataModel;




  // const HomeView({Key? key, this.mediaUrlList, this.userDataModel}) : super(key: key);
  const HomeView({Key? key,}) : super(key: key);

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

  //build a view for spotify user details
  Widget buildSpotifyView(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(  child: Image.network( userDataModel!.images[0].url), radius: 50),
    SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userDataModel!.displayName, style: Theme.of(context).textTheme.headlineSmall,),
                   SizedBox(height: 6,),

           Row(
            children: [

              Text(userDataModel!.email, style: Theme.of(context).textTheme.labelLarge,),
            ],
          ),
    SizedBox(height: 6,),

          Row(
            children: [
              Text('Followers: ', style: Theme.of(context).textTheme.labelLarge,),
              Text(userDataModel!.followers.total.toString()),
            ],
          ),
                ],
              ),
            ],
          ),
   
    
    
          // Text(userDataModel!.id),
          // Text(userDataModel!.product),
          // Text(userDataModel!.type),
          // Text(userDataModel!.uri),
        ],
      ),
    );
  }

// build a view to show users recently played songs in listview
  Widget buildSongsView(BuildContext context) {
    return  ListView.builder(
      // scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recentSongs!.items.length,
      itemBuilder: (context, index) => ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          child: Image.network(recentSongs!.items[index].track.album.images[0].url),
        ),
        title: Text(recentSongs!.items[index].track.name),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 100, child: Text(recentSongs!.items[index].track.artists[0].name)),
            SizedBox(width: 200, child: Text(recentSongs!.items[index].track.album.name)),
          ],
        ),

      ),
      
    );
  }


}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController tabController;

  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FeedCheck',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                text: 'Instagram',
              ),
              Tab(text: 'Spotify'),
            ],
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          mediaUrlList == null
              ? TextButton.icon(
                  onPressed: LoginViewmodel.onInstaPressed,
                  icon: const Icon(
                    Icons.login,
                  ),
                  label: const Text(
                    'Login',
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: widget.buildGridView()),
          userDataModel == null ?
          TextButton.icon(
            onPressed: LoginViewmodel.onSpotifyPressed,
            icon: const Icon(
              Icons.login,
            ),
            label: const Text(
              'Login',
            ),
          ) :  Padding(

                  padding: const EdgeInsets.only(top: 2),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.buildSpotifyView(context),
                        widget.buildSongsView(  context),
                  
                      ],
                    ),
                  )),
        ]));
  }
}
