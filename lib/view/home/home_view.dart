import 'package:flutter/material.dart';

import '../authentication/login/login_viewmodel.dart';

class HomeView extends StatefulWidget {
  final List<String>? mediaUrlList;

  const HomeView({Key? key, this.mediaUrlList}) : super(key: key);

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
          widget.mediaUrlList == null
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
          TextButton.icon(
            onPressed: LoginViewmodel.onSpotifyPressed,
            icon: const Icon(
              Icons.login,
            ),
            label: const Text(
              'Login',
            ),
          ),
        ]));
  }
}
